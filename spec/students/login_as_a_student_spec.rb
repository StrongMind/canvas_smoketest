require 'spec_helper'

describe "A student logging in" do
  before(:all) { configure_driver }
  after(:all)  { @driver.quit }
  include_examples "student login"

  it 'I can login' do
    expect {
      @driver.find_element(:class, "ic-Dashboard-header__title")
    }.to_not raise_error
  end
end

describe 'a student trying to login with missing credentials' do
  before(:all) { configure_driver }
  after(:all)  { @driver.quit }
  before do
    @driver.get "https://courseware-staging.strongmind.com/login/canvas"
    @driver.find_element(:xpath, "//button[@type='submit']").click
  end

  it 'I see an error' do
    expect { @driver.find_element(:class, "error_text") }.to_not raise_error
  end
end

describe "As a new student logging in" do
  it "I should see the EULA"
  it 'I have to accept the EULA to continue'
  it 'I see the notification preferences alert'
  it 'I see a course invitation'
  it 'I can accept a course invitation'
  it 'I can decline a course invitation'
end
