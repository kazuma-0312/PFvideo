FactoryBot.define do
  factory :tweet do
    text { Faker::Lorem.sentence }
    title { Faker::Lorem.sentence }
    youtube_url { 'https://www.youtube.com/watch?v=oyqqcgpWzsM' }
    association :user
  end
end
