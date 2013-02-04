class Qtl < ActiveRecord::Base
  belongs_to :phavu_content,
    :foreign_key => "organism_id"

  attr_accessible :organism_id, :qtl_experiment_id, :qtl_symbol, :qtl_identifier, 
     :qtl_pub_name, :favorable_allele_source, :treatment, :lod, :likelihood_ratio, 
     :marker_r2, :total_r2, :additivity, :map_collection_id, :consensus_map_id, :lg,
     :left_end, :right_end, :nearest_marker, :flanking_marker_low, :flanking_marker_high,
     :comment

end
