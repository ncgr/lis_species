# Be sure to restart your server when you modify this file.

Lotja::Application.config.session_store :active_record_store

ActionController::Base.session = {
  :key => '_lis_site_session',
  :expire_after => 2.days
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# Lotja::Application.config.session_store :active_record_store
