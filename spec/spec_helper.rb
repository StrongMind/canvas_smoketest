require 'byebug'
require "json"
require "selenium-webdriver"
require "rspec"
require 'examples/student_examples'
require 'examples/teacher_examples'
require 'examples/admin_examples'
# require 'katalon_helpers'
include RSpec::Expectations

def configure_driver
  options = Selenium::WebDriver::Firefox::Options.new(args: [ENV['SHOW_BROWSER'] ? nil : '-headless'])
  @driver = Selenium::WebDriver.for :firefox, options: options
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
