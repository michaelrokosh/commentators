# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :fiction do
    user_id 1
    title "MyString"
    content "MyText"
    godnota false
  end
end
