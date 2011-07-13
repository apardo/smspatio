# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_smspatio_session',
  :secret      => 'f0eb87d5c766d2fcae181dfe6dff5c56e8e4f6158a3549fe2793869d7b4c4e59f539112337872001d8398b735d04eee914d2d818f5808594bb46c53b9d731a5c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
ActionController::Base.session_store = :active_record_store
