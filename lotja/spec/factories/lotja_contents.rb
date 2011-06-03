FactoryGirl.define do
  factory :lotja_content do
    legume_id 1
    lotja_resource { association(:lotja_resource) }
    lotja_selected_reference { association(:lotja_selected_reference) }
    lotja_genome_summary { association(:lotja_genome_summary) }
  end
end