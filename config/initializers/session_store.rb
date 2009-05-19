# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_allefakten_session',
  :secret      => '46ee3aec62a5d76a349eca29aa36f9634d176a5a31afc4ffe353d918d47e92d9c87ca5fe9c12e6f9f8b4c5db520b0b49726a07a7408c424a7af09724ae0362f3'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
