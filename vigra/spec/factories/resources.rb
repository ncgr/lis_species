FactoryGirl.define do
  factory :resource do
    legume_id 1
    resource_type "dataset"
    description "a new dataset"
    url "http://google.com"
    is_public 1
  end
end