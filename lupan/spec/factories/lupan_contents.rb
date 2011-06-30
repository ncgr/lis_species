FactoryGirl.define do
  factory :lupan_content do
    legume_id 1
    lupan_selected_reference { association(:lupan_selected_reference) }
    lupan_genome_summary { association(:lupan_genome_summary) }
  end
end
