require 'dotenv'
require 'rspec'
require 'capybara/rspec'
require 'capybara-webkit'
require 'selenium-webdriver'
require 'percy/capybara'

# Load environment variable
Dotenv.load

# Add the 'spec' path in the load path
spec_dir = File.dirname(__FILE__)
$LOAD_PATH.unshift(spec_dir)

# RSpec config here
RSpec.configure do |config|

  # Capybara config here
  Capybara.configure do |capybara|
    # Don't run a rack app
    capybara.run_server = false

    capybara.default_driver = :selenium_chrome
    capybara.javascript_driver = :selenium_chrome
  end

  # Initialize percy instance
  config.before(:suite) { Percy::Capybara.initialize_build }
  config.after(:suite) { Percy::Capybara.finalize_build }

  # Don't forget to tell to RSpec to include Capybara :)
  config.include Capybara::DSL
end