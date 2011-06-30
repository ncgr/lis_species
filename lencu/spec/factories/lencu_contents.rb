FactoryGirl.define do
  factory :lencu_content do
    legume_id 1
    lencu_selected_reference { association(:lencu_selected_reference) }
    lencu_genome_summary { association(:lencu_genome_summary) }
  end
end
