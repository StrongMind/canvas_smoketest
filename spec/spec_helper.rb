require 'byebug'
require "json"
require "selenium-webdriver"
require "rspec"
require 'examples/student_examples'
require 'katalon_helpers'
include RSpec::Expectations

def configure_driver
  options = Selenium::WebDriver::Firefox::Options.new(args: ['-headless'])
  @driver = Selenium::WebDriver.for :firefox, options: options
  @accept_next_alert = true
  @driver.manage.timeouts.implicit_wait = 30
  @base_url = "https://courseware-staging.strongmind.com/"
end
