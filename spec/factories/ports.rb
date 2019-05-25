FactoryBot.define do
  factory :port do
    name { Faker::Lorem.sentence(3) }
    code { Faker::Code.asin }
    city { Faker::Address.city }
    oceans_insight_code { Faker::Code.asin }
    lat { Faker::Address.latitude }
    lng { Faker::Address.longitude }
    big_schedules { Faker::Lorem.sentence(3) }
    port_type { %w[airport seaport].sample }
    port_hub { true }
    oceans_insights { Faker::Lorem.sentence(3) }
  end
end
