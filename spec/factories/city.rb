FactoryGirl.define do
  factory :city do |f|
      name {FFaker::Address.city}
  end

end