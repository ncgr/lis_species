FactoryGirl.define do
  factory :pea_content do
    legume_id 1
    pea_selected_reference { association(:pea_selected_reference) }
    pea_genome_summary { association(:pea_genome_summary) }
  end
end
