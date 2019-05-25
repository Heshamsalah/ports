FactoryBot.define do
  factory :port do
    name { Faker::Lorem.sentence(3) }
    sequence(:code) { |n| Faker::Code.asin + "#{n}" }
    city { Faker::Address.city }
    oceans_insights_code { Faker::Code.asin }
    lat { Faker::Address.latitude }
    lng { Faker::Address.longitude }
    big_schedules { Faker::Lorem.sentence(3) }
    port_type { %w[airport seaport].sample }
    port_hub { true }
    ocean_insights { Faker::Lorem.sentence(3) }
  end
end
