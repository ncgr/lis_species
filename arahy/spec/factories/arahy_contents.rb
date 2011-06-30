FactoryGirl.define do
  factory :arahy_content do
    legume_id 1
    arahy_selected_reference { association(:arahy_selected_reference) }
    arahy_genome_summary { association(:arahy_genome_summary) }
  end
end
