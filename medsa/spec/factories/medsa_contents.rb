FactoryGirl.define do
  factory :medsa_content do
    legume_id 1
    medsa_selected_reference { association(:medsa_selected_reference) }
    medsa_genome_summary { association(:medsa_genome_summary) }
  end
end