APPIUM_URL = 'http://localhost:4723/wd/hub'

android_capabilities = { browserName: "Chrome", platformName: "Android", deviceName: "Android Simulator" }
opera_capabilities = { browserName: "Opera", "chromeOptions":{"args":[],"extensions":[],"binary": "/usr/bin/opera"} }

Capybara.register_driver :selenium_safari do |app|
  Capybara::Selenium::Driver.new(app, :browser => :safari)
end

Capybara.register_driver :selenium_opera do |app|
  Capybara::Selenium::Driver.new(app, :browser => :remote, :url => "http://localhost:9515", :desired_capabilities => opera_capabilities)
end

Capybara.register_driver :selenium_android do |app|
  Capybara::Selenium::Driver.new(app, :browser => :remote, :url => APPIUM_URL, :desired_capabilities => android_capabilities)
end