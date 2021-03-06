require 'spec_helper'

describe "dashboard as a teacher" do
  before(:all) { configure_driver }
  after(:all)  { @driver.quit unless ENV['KEEP_BROWSERS'] }

  include_examples "teacher login"

  it 'I can see all of the courses I am teaching' do
    expect ( @driver.find_elements(:css, "div.ic-DashboardCard__header_image").length ) == 1
  end

end
