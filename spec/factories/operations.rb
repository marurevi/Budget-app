FactoryBot.define do
  factory :operation do
    name { 'Operation_name' }
    amount { 1.5 }
    user
  end
end
