FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'P@ssW0rd' }
    password_confirmation { password }

    after(:create) do |user, _|
      token = JsonWebToken.encode(user_id: user.id)
      time = Time.now + 24.hours.to_i

      user.update_attributes!(
        token: token,
        token_created_at: Time.now,
        token_expires_at: time
      )
    end
  end
end
