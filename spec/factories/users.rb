FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email 'foo@gar.com'
    password 'foobar'
  end
end
