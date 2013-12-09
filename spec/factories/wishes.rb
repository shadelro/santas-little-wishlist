# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :wish do
    name "MyString"
    description "MyString"
    wishlist_id 1
    user_id 1
  end
end
