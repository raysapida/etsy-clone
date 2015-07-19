require 'faker'

FactoryGirl.define do
  factory :user do |f|
    f.name { Faker::Name.first_name }

    f.email { Faker::Internet.email }

    pass = Faker::Internet.password
    f.password { pass }
    f.password_confirmation { pass }

  end
end
