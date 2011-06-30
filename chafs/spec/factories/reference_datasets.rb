FactoryGirl.define do
  factory :reference_dataset do
    legume_id 1
    reference_dataset_type "dataset"
    description "a new dataset"
    source "interwebs"
    url "http://google.com"
    is_public 1
  end
end