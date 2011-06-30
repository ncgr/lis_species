FactoryGirl.define do
  factory :cajca_content do
    legume_id 1
    cajca_selected_reference { association(:cajca_selected_reference) }
    cajca_genome_summary { association(:cajca_genome_summary) }
  end
end
