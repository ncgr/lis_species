FactoryGirl.define do
  factory :glyma_content do
    legume_id 1
    glyma_selected_reference { association(:glyma_selected_reference) }
    glyma_genome_summary { association(:glyma_genome_summary) }
  end
end