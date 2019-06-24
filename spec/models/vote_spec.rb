require 'rails_helper'

RSpec.describe Vote, type: :model do
  let(:topic) { create(:topic) }
  let(:user) { create(:user) }
  let(:post) { create(:post) }
  let(:vote) { Vote.create!(value: 1, post: post, user: user) }
  #let(:vote) { create(:vote) }

  #The code refactor that Bloc wanted me to do was causing an error to be thrown on the final spec. After discussing the issue on Slack with technical coach Logan Gingerich, he suggested I stick with the other code, and that there is likely a syntax issue with the FactoryGirl update. 

  #MESSAGE FROM LOGAN: I'm actually starting to wonder if this issue has something to do with updates to Factory Girl (now known as Factory Bot). Using this same setup in a previous iteration of Factory Girl seems to work.. For now, I would stick with the "let(:vote) { Vote.create!(value: 1, post: post, user: user) }" and just note that the updated syntax seems to cause issues for the one particular spec (and you can reference our conversation).
 
  it { is_expected.to belong_to(:post) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:value) }
#  it { is_expected.to validate_inclusion_of(:value).in_array([-1, 1]) }
  it do
    should validate_inclusion_of(:value).
    in_array([-1, 1]).
    with_message("123456789 is not a valid vote.")
  end

  describe "update_post callback" do
    it "triggers update_post on save" do
      expect(vote).to receive(:update_post).at_least(:once)
      vote.save!
    end
 
    it "#update_post should call update_rank on post " do
      expect(post).to receive(:update_rank).at_least(:once)
      vote.save!
    end
  end
end
