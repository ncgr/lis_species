FactoryGirl.define do
  factory :lupal_content do
    legume_id 1
    lupal_selected_reference { association(:lupal_selected_reference) }
    lupal_genome_summary { association(:lupal_genome_summary) }
  end
end
