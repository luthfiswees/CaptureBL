begin
    require 'rspec/core/rake_task'
    require 'dotenv'
    
    # Load environment variables
    Dotenv.load 
  
    # Task to execute specs    
    RSpec::Core::RakeTask.new(:spec)

    # Task to initiate test
    task :test do
        drivers = ["android", "firefox", "chrome", "safari", "opera"]
        puts "Test start"
        
        drivers.each do |driver|
          ENV['CURRENT_DRIVER'] = driver

          if driver == "opera" then
            `(mv #{ENV["CHROMEDRIVER_DIR"]}/chromedriver #{ENV["CHROMEDRIVER_DIR"]}/cchromedriver)`
            `(mv #{ENV["CHROMEDRIVER_DIR"]}/operadriver #{ENV["CHROMEDRIVER_DIR"]}/chromedriver)`
          end

          Rake::Task['spec'].reenable
          Rake::Task['spec'].invoke

          if driver == "opera" then
            `(mv #{ENV['CHROMEDRIVER_DIR']}/chromedriver #{ENV['CHROMEDRIVER_DIR']}/operadriver)`
            `(mv #{ENV['CHROMEDRIVER_DIR']}/cchromedriver #{ENV['CHROMEDRIVER_DIR']}/chromedriver)`
          end
        end
    end

    # Set default task for 'bundle exec rake'
    task :default => :test
  rescue LoadError
end