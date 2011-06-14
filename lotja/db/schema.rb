# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 0) do

  create_table "development_activities", :force => true do |t|
    t.text   "body"
    t.string "date"
  end

  create_table "glyma_contents", :force => true do |t|
    t.text     "overview"
    t.string   "taxon_id"
    t.text     "special_interest"
    t.string   "nodulation_type"
    t.text     "nodulation_type_information"
    t.string   "nodulator_species"
    t.string   "nodulator_taxon_id"
    t.string   "flowering_type"
    t.text     "flowering_type_information"
    t.string   "pollination_type"
    t.text     "pollination_type_information"
    t.string   "self_incompatibility"
    t.string   "inbreeding"
    t.string   "wiki_link"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "legume_id",                    :null => false
  end

  create_table "glyma_genome_summaries", :force => true do |t|
    t.text    "genome_summary"
    t.string  "chromosomes"
    t.string  "genome_size"
    t.text    "genome_size_information"
    t.string  "ploidy_type"
    t.string  "gc_content_genome"
    t.text    "gc_content_genome_information"
    t.string  "gc_content_transcriptome"
    t.text    "gc_content_transcriptome_information"
    t.string  "chloroplast_genome_size"
    t.text    "chloroplast_genome_size_information"
    t.string  "chloroplast_accession_number"
    t.string  "mitochondria_genome_size"
    t.text    "mitochondria_genome_size_information"
    t.string  "mitochondria_accession_number"
    t.integer "glyma_content_id",                     :null => false
  end

  create_table "glyma_selected_references", :force => true do |t|
    t.text    "selected_references"
    t.integer "glyma_content_id",    :null => false
  end

  create_table "legumes", :force => true do |t|
    t.string "name",       :null => false
    t.string "short_name", :null => false
  end

  add_index "legumes", ["name"], :name => "name_UNIQUE", :unique => true
  add_index "legumes", ["short_name"], :name => "short_name_UNIQUE", :unique => true

  create_table "lotja_contents", :force => true do |t|
    t.string   "taxon_id"
    t.text     "overview"
    t.text     "special_interest"
    t.string   "nodulation_type"
    t.text     "nodulation_type_information"
    t.string   "nodulator_species"
    t.string   "nodulator_taxon_id"
    t.string   "flowering_type"
    t.text     "flowering_type_information"
    t.string   "pollination_type"
    t.text     "pollination_type_information"
    t.string   "self_incompatibility"
    t.string   "wiki_link"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "legume_id",                    :null => false
  end

  create_table "lotja_genome_summaries", :force => true do |t|
    t.text    "genome_summary"
    t.string  "chromosomes"
    t.string  "genome_size"
    t.text    "genome_size_information"
    t.string  "ploidy_type"
    t.string  "gc_content_genome"
    t.text    "gc_content_genome_information"
    t.string  "gc_content_transcriptome"
    t.text    "gc_content_transcriptome_information"
    t.string  "chloroplast_genome_size"
    t.text    "chloroplast_genome_size_information"
    t.string  "chloroplast_accession_number"
    t.string  "mitochondria_genome_size"
    t.text    "mitochondria_genome_size_information"
    t.string  "mitochondria_accession_number"
    t.integer "lotja_content_id",                     :null => false
  end

  create_table "lotja_selected_references", :force => true do |t|
    t.text    "selected_references"
    t.integer "lotja_content_id",    :null => false
  end

  create_table "medtr_contents", :force => true do |t|
    t.text     "overview"
    t.string   "taxon_id"
    t.text     "special_interest"
    t.string   "nodulation_type"
    t.text     "nodulation_type_information"
    t.string   "nodulator_species"
    t.string   "nodulator_taxon_id"
    t.string   "flowering_type"
    t.text     "flowering_type_information"
    t.string   "pollination_type"
    t.text     "pollination_type_information"
    t.string   "self_incompatibility"
    t.string   "wiki_link"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "legume_id",                    :null => false
  end

  create_table "medtr_genome_summaries", :force => true do |t|
    t.text    "genome_summary"
    t.string  "chromosomes"
    t.string  "genome_size"
    t.text    "genome_size_information"
    t.string  "ploidy_type"
    t.string  "gc_content_genome"
    t.text    "gc_content_genome_information"
    t.string  "gc_content_transcriptome"
    t.text    "gc_content_transcriptome_information"
    t.string  "chloroplast_genome_size"
    t.text    "chloroplast_genome_size_information"
    t.string  "chloroplast_accession_number"
    t.string  "mitochondria_genome_size"
    t.text    "mitochondria_genome_size_information"
    t.string  "mitochondria_accession_number"
    t.integer "medtr_content_id",                     :null => false
  end

  create_table "medtr_selected_references", :force => true do |t|
    t.text    "selected_references"
    t.integer "medtr_content_id",    :null => false
  end

  create_table "meetings", :force => true do |t|
    t.string "title"
    t.string "url"
    t.date   "start_date"
    t.date   "end_date"
  end

  create_table "news_articles", :force => true do |t|
    t.string   "title",      :null => false
    t.text     "body"
    t.datetime "created_at"
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "pages", ["title"], :name => "title_UNIQUE", :unique => true

  create_table "pathogens", :force => true do |t|
    t.integer "legume_id",     :null => false
    t.string  "name"
    t.string  "ncbi_taxon_id"
  end

  create_table "phavu_contents", :force => true do |t|
    t.text     "overview"
    t.text     "genome_summary"
    t.text     "resources"
    t.text     "selected_references"
    t.string   "file_name"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "reference_datasets", :force => true do |t|
    t.integer "legume_id",                                          :null => false
    t.string  "reference_dataset_type"
    t.string  "description"
    t.string  "source"
    t.string  "url"
    t.integer "is_public",              :limit => 1, :default => 1
  end

  create_table "resources", :force => true do |t|
    t.integer "legume_id",                                 :null => false
    t.string  "resource_type"
    t.string  "description"
    t.string  "url"
    t.integer "is_public",     :limit => 1, :default => 1
  end

  create_table "roles", :force => true do |t|
    t.string "name"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "user_roles", :force => true do |t|
    t.integer "user_id", :null => false
    t.integer "role_id", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username",                                           :null => false
    t.string   "encrypted_password",   :limit => 128,                :null => false
    t.string   "password_salt",                                      :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",                     :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
