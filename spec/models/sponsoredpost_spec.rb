require 'rails_helper'

RSpec.describe Sponsoredpost, type: :model do
  let(:name) { RandomData.random_sentence }
  let(:description) { RandomData.random_paragraph }
  let(:title) { RandomData.random_sentence }
  let(:body) { RandomData.random_paragraph }
  let(:price) { 50 }
  let(:topic) { Topic.create!(name: name, description: description) }
  let(:sponsoredpost) { topic.sponsoredposts.create!(title: title, body: body, price: price) }
 
  it { should belong_to(:topic) }

  describe "attributes" do
    it "has title and body attributes" do 
      expect(sponsoredpost).to have_attributes(title: title, body: body, price: price)
    end
  end
end
