require 'rails_helper'

RSpec.describe "posts/show.html.erb", type: :view do

let(:user) { create(:user, email: "blochead@bloc.io") }

  describe "favorites" do 
    before do
      topic = Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph)
      @post = topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: user)
    end

    it "displays posts that the current user has favorited" do 
      favorite = user.favorites.where(post: @post).create
      expect(user.favorite_for(@post)).to eq(favorite)
    end

    it "displays the author's gravtar" do
      expected_gravatar = "http://gravatar.com/avatar/bb6d1172212c180cfbdb7039129d7b03.png?s=48"
      expect(user.avatar_url(48)).to eq(expected_gravatar)
    end
  end
end
