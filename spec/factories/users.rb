# FactoryGirl.define do
#   factory :user do |f|
#       email {FFaker::Internet.email}
#       password {Devise.friendly_token.first(8)}
  
#       after(:create) do |user|
#           create(:profile, user: user)
#       end
#   end

# end