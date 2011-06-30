FactoryGirl.define do
  factory :tripr_content do
    legume_id 1
    tripr_selected_reference { association(:tripr_selected_reference) }
    tripr_genome_summary { association(:tripr_genome_summary) }
  end
end
