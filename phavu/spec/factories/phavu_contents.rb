FactoryGirl.define do
  factory :phavu_content do
    legume_id 1
    phavu_selected_reference { association(:phavu_selected_reference) }
    phavu_genome_summary { association(:phavu_genome_summary) }
  end
end
