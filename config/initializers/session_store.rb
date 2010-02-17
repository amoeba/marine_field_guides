# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key    => '_field_guides_session',
  :secret => 'a4c7118f0c1c0f985aae4a8256ce37a6eceadfa4f9dad53da446937708f19cc0be3d5ce0f2df9aba7445e3b45e8fab0fc0e904508a9d019db20b8d97e5cc0f1d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
