FactoryGirl.define do

  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "Person_#{n}@gmail.com"}
    password "password"
    password_confirmation "password"

  end

  factory :post do
    sequence(:title)  { "test"*2 }
    sequence(:body) { "test"*60 }
    sequence(:image) { File.open("public/uploads/post/test_images/1.jpg") }
  end

  factory :comment do
    sequence(:body) { "test"*10 }
    sequence(:user_id) { "1"}
  end

  trait :with_post do
    after :create do |user|
      FactoryGirl.create_list :post, 1, :user => user
    end
  end

  trait :with_posts do
    after :create do |user|
      FactoryGirl.create_list :post, 5, :user => user
    end
  end

end
