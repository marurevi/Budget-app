FactoryBot.define do
  factory :operation do
    name { "name" }
    amount { 1.5 }
    user
  end
end
