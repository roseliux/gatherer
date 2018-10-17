FactoryBot.define do
  factory :task do
    title { "Things to do" }
    size { 1 }
    completed_at { nil }
  end
end
