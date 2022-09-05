FactoryBot.define do
  factory :user do
    name { 'name' }
    sequence :email do |n|
      "person#{n}@example.com"
    end
    password { 'password' }
  end
end
