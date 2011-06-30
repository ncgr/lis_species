FactoryGirl.define do
  factory :chafs_content do
    legume_id 1
    chafs_selected_reference { association(:chafs_selected_reference) }
    chafs_genome_summary { association(:chafs_genome_summary) }
  end
end
