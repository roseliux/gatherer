FactoryBot.define do
  factory :task do
    sequence(:title) { |n| "Task #{n}" }
    size { 3 }
    completed_at { nil }
    project

    trait :small do
      size { 1 }
    end

    trait :large do
      size { 5 }
    end

    trait :newly_complete do
      completed_at { 1.day.ago }
    end

    trait :long_complete do
      completed_at { 6.month.ago }
    end

    factory :trivial, class: Task, traits: %i[small]
    factory :panic, class: Task, traits: %i[large]

  end
end
