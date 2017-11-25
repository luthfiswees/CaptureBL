case ENV['CURRENT_DRIVER']
when "firefox"
    Capybara.default_driver = :selenium
    Capybara.javascript_driver = :selenium
when "chrome"
    Capybara.default_driver = :selenium_chrome
    Capybara.javascript_driver = :selenium_chrome
when "safari"
    Capybara.default_driver = :selenium_safari
    Capybara.javascript_driver = :selenium_safari
when "opera"
    Capybara.default_driver = :selenium_chrome
    Capybara.javascript_driver = :selenium_chrome
when "android"
    Capybara.default_driver = :selenium_android
    Capybara.javascript_driver = :selenium_android
else
    puts "Driver not registered"
end

puts "Current driver is #{ENV['CURRENT_DRIVER']}"