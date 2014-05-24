# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :fact do
    user_id 1
    godnota false
    title "MyString"
    content "MyText"
    image ""
  end
end
