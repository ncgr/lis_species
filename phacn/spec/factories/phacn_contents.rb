FactoryGirl.define do
  factory :phacn_content do
    legume_id 1
    phacn_selected_reference { association(:phacn_selected_reference) }
    phacn_genome_summary { association(:phacn_genome_summary) }
  end
end
