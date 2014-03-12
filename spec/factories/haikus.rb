# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :haiku do
    first_five "MyString"
    middle_seven "MyString"
    last_five "MyString"
    user_id 1
  end
end
