FactoryGirl.define do
  factory :cicar_content do
    legume_id 1
    cicar_selected_reference { association(:cicar_selected_reference) }
    cicar_genome_summary { association(:cicar_genome_summary) }
  end
end
