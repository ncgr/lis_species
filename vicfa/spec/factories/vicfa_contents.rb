FactoryGirl.define do
  factory :vicfa_content do
    legume_id 1
    vicfa_selected_reference { association(:vicfa_selected_reference) }
    vicfa_genome_summary { association(:vicfa_genome_summary) }
  end
end
