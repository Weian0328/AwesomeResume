FactoryBot.define do
  factory :comment do
    user { nil }
    resume { nil }
    content { "MyText" }
    deleted_at { "2022-05-03 15:37:37" }
  end
end
