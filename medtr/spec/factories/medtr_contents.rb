FactoryGirl.define do
  factory :medtr_content do
    legume_id 1
    medtr_selected_reference { association(:medtr_selected_reference) }
    medtr_genome_summary { association(:medtr_genome_summary) }
  end
end