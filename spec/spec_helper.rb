require 'rspec'
require 'capybara/rspec'
require 'selenium-webdriver'
require 'headless'
require 'percy/capybara'

# Create headless object
if ENV['IS_LINUX'] and ENV['IS_HEADLESS'] then
  @headless = Headless.new
end

# Add the 'spec' path in the load path
spec_dir = "#{File.dirname(__FILE__)}/test"
$LOAD_PATH.unshift(spec_dir)

# Read host for smoke test
site = ENV['TEST_HOST'] || 'https://www.bukalapak.com'

# Require driver settings
require 'driver'

# RSpec config here
RSpec.configure do |config|

  # Capybara config here
  Capybara.configure do |capybara|
    # Don't run a rack app
    capybara.run_server = false

    # Set smoke test host
    capybara.app_host = site

    # switch driver
    require 'driver_switch'
  end

  # Setup config before suite
  config.before(:suite) {
    if @headless then
      @headless.start
    end
    Percy::Capybara.initialize_build
  }

  # Setup config after suite
  config.after(:suite) { 
    Percy::Capybara.finalize_build
    if @headless then
      @headless.destroy
    end
  }

  # Don't forget to tell to RSpec to include Capybara :)
  config.include Capybara::DSL
end