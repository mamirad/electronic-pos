# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
PushvendorPos::Application.initialize!
AppConfig = YAML::load_file('config/application.yml')