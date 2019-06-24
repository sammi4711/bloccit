FactoryGirl.define do
  factory :comments do
    body RandomData.random_paragraph
    user
    post 
  end
end 