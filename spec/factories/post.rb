FactoryGirl.define do
  factory :post do
    title "Post Title"
    climber_id { FactoryGirl.create(:climber) }
  end
end
