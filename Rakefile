begin
    require 'rspec/core/rake_task'
    require 'dotenv'
    
    # Load environment variables
    Dotenv.load 
  
    # Task to execute specs    
    RSpec::Core::RakeTask.new(:spec)

    # Task to initiate test
    task :test do
        drivers = ["firefox", "chrome", "opera"]
        puts "Test start"
        
        drivers.each do |driver|
          ENV['CURRENT_DRIVER'] = driver

          Rake::Task['spec'].reenable
          Rake::Task['spec'].invoke

        end
    end

    # Set default task for 'bundle exec rake'
    task :default => :test
  rescue LoadError
end