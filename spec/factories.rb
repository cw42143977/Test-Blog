FactoryGirl.define do
  factory :user do
    name                  "Test User"
    username              "Testicle"
    email                 "test@example.com"
    password              "Foobar13"
    password_confirmation "Foobar13"
  end
end
