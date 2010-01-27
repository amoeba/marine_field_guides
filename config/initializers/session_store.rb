# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_Rails_session',
  :secret      => 'db71e19760f1622d8d8f266705ce679fcfe92e5351c81cc030606b51225c81a3e9646a6ebdc3dda77074d12741483b1d1e5a9f85853222ace9f11ba3bc70d025'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
