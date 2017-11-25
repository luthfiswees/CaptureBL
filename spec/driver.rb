APPIUM_URL = 'http://localhost:4723/wd/hub'

android_capabilities = { browserName: "Chrome", platformName: "Android", deviceName: "Android Simulator" }

Capybara.register_driver :selenium_safari do |app|
  Capybara::Selenium::Driver.new(app, :browser => :safari)
end

Capybara.register_driver :selenium_android do |app|
  Capybara::Selenium::Driver.new(app, :browser => :remote, :url => APPIUM_URL, :desired_capabilities => android_capabilities)
end