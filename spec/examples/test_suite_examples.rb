# RSpec.shared_examples "new driver with each test" do
#   before(:each) do
#     @driver = Selenium::WebDriver.for :firefox #, options: options
#     @accept_next_alert = true
#     @driver.manage.timeouts.implicit_wait = 30
#     @base_url = "https://courseware-staging.strongmind.com/"
#   end
#
#   after(:each) do
#     @driver.quit
#   end
# end
