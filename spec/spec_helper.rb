require 'byebug'
require "json"
require "selenium-webdriver"
require "rspec"
require 'examples/student_examples'
require 'examples/teacher_examples'
require 'examples/admin_examples'
require 'chromedriver-helper'
require 'capybara'
# require 'katalon_helpers'
include RSpec::Expectations

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.javascript_driver = :chrome

Capybara.configure do |config|
  config.default_max_wait_time = 10 # seconds
  config.default_driver        = :selenium
end

def configure_driver
  options = Selenium::WebDriver::Chrome::Options.new(args: ['-headless'])
  @driver = Selenium::WebDriver.for :chrome, options: options
  @accept_next_alert = true
  @driver.manage.timeouts.implicit_wait = 30
  @base_url = "https://courseware-staging.strongmind.com/"
end

def close_alert_and_get_its_text
  begin
    alert = @driver.switch_to.alert()
    alert_text = alert.text
    if @accept_next_alert then
      alert.accept
    else
      alert.dismiss
    end
    alert_text
  ensure
    @accept_next_alert = true
  end
end
