# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/rspec'
require 'factory_girl'
require 'database_cleaner'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  config.mock_with :rspec
  config.use_transactional_fixtures = false
  config.infer_base_class_for_anonymous_controllers = false

  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true

  ## DatabaseCleaner ##
  DatabaseCleaner.logger = Rails.logger
  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  # Controller Macros
  config.extend DeviseMacros, :type => :controller

  # Role Macros
  config.include(RoleMacros)

  # Host Macros
  config.include(HostMacros)
end
