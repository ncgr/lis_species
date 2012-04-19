FactoryGirl.define do
  factory :medsa_content do
    overview "this is the overview"
    ncbi_taxon_id "1234"
    grin_taxon_id "6789"
    special_interest "this is the special interest"
    nodulation_type "nodulation"
    nodulation_type_information "nodulation is good"
    flowering_type "flowering"
    flowering_type_information "flowering is good"
    pollination_type "pollination"
    pollination_type_information "pollination is good"
    self_incompatibility "incompatibility"
    wiki_link "http://en.wikipedia.org"
    user_id "1"
    medsa_selected_reference { association(:medsa_selected_reference) }
    medsa_genome_summary { association(:medsa_genome_summary) }
    legume
    maps "nice map!"
  end
end
