# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ceslet_session',
  :secret      => 'abbfa5517a725ed5d46329eafa6d94dde2788b02d86e23acdeb05a6eee4552799ea9cb7d890be24efcf2df933527b2b0bc2ad3860e3e5e5635579325c0b31449'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
