FactoryGirl.define do
  factory :profile do |f|
      name {FFaker::Name.name}
      gender {FFaker::Gender.random}
      
#       password {Devise.friendly_token.first(8)}
#     # f.name { Faker::Name.name  }
#     # f.starts_at { Faker::Date.backward(Random.rand(20)).to_date }
#     # f.description { Faker::Lorem.paragraph }
#     # f.primary { true }
#     # f.primary_pdf { Faker::Avatar.image }
#     # f.setgeek_id { Random.rand(20) }
  end

end