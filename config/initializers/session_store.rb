# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_todo_list_session',
  :secret      => '9b7625ff2485dee8d1cb27ccbc75754a55c0a83aa6ae8e0ce968e4226bb926b2cf93087e8c6e80268edc139fe3cfff77b317670a5a7e7c4cccc82e01aaa182f5'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
