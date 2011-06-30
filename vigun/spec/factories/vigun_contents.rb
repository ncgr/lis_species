FactoryGirl.define do
  factory :vigun_content do
    legume_id 1
    vigun_selected_reference { association(:vigun_selected_reference) }
    vigun_genome_summary { association(:vigun_genome_summary) }
  end
end
