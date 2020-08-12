require 'capybara/rspec'
require 'selenium-webdriver'
require 'capybara'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app)
end

Capybara.default_driver = :selenium
Capybara.javascript_driver = :selenium

  
#Chromedriver.set_version "2.28"

#Capybara.default_driver = :headless_chrome
#Capybara.javascript_driver = :selenium_chrome
#Capybara.current_driver = :selenium_chrome
Capybara.app_host = 'https://the-internet.herokuapp.com'
Capybara.default_max_wait_time = 10

RSpec.configure do |config|
  config.formatter = :documentation
  #config.use_transactional_fixtures = false
end