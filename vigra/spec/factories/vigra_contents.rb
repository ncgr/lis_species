FactoryGirl.define do
  factory :vigra_content do
    legume_id 1
    vigra_selected_reference { association(:vigra_selected_reference) }
    vigra_genome_summary { association(:vigra_genome_summary) }
  end
end
