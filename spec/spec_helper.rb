require 'dotenv/load'
require 'byebug'
require 'json'
require 'selenium-webdriver'
require 'rspec'
require 'examples/student_examples'
require 'examples/teacher_examples'
require 'examples/admin_examples'
require 'capybara'
require 'chromedriver-helper'
require 'pry'

include RSpec::Expectations

# Capybara.register_driver(:headless_chrome) do |app|
#   capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
#     chromeOptions: { args: %w[headless disable-gpu] }
#   )
#
#   Capybara::Selenium::Driver.new(
#     app,
#     browser: :chrome,
#     desired_capabilities: capabilities
#   )
# end

# Capybara.javascript_driver = :headless_chrome

class Config
  attr_accessor :implicit_wait, :accept_next_alert

  def initialize(options = {})
    @implicit_wait = options[:implicit_wait]
    @accept_next_alert = options[:accept_next_alert]
  end
end

def configure_driver
  @config = Config.new(
    implicit_wait: ENV['IMPLICIT_WAIT'] ? ENV['IMPLICIT_WAIT'].to_i : 30
  )

  options = Selenium::WebDriver::Firefox::Options.new(args: [ENV['SHOW_BROWSER'] ? nil : '--headless'])
  @driver = Selenium::WebDriver.for :firefox, options: options
  @config.accept_next_alert = true
  @driver.manage.timeouts.implicit_wait = @config.implicit_wait
  @base_url = "https://courseware-staging.strongmind.com/"
end

def close_alert_and_get_its_text
  begin
    alert = @driver.switch_to.alert()
    alert_text = alert.text
    if @config.accept_next_alert
      alert.accept
    else
      alert.dismiss
    end
    alert_text
  ensure
    @config.accept_next_alert = true
  end
end

def wait_for_link(link_name, seconds = 30)
  wait = Selenium::WebDriver::Wait.new(:timeout => (seconds || @config.implicit_wait))
  wait.until { @driver.find_element(css: "a[href*='#{link_name}']") }
end

def wait_for(seconds = 30, &block)
  old_wait = @config.implicit_wait
  @driver.manage.timeouts.implicit_wait = seconds
  yield block
  @driver.manage.timeouts.implicit_wait = old_wait
end

RSpec.configure do |config|
  config.before(:all) do
    configure_driver
  end

  config.after(:all) do
    @driver.quit if @driver && !ENV['KEEP_BROWSERS']
  end
end
