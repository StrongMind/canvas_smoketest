require 'spec_helper'

context 'When unauthenticated' do
  describe 'Attempting to visit assignment show page' do
    it 'does not raise an exception' do
      # Not real course/assignment ids, but doesn't matter.
      # We're making sure Assignment show action doesn't blow up before redirect to login
      expect {
        @driver.get 'https://courseware-staging.strongmind.com/courses/1/assignments/1'
      }.not_to raise_error

      # redirect to login page successfully
      expect {
        @driver.find_element(:css, '.login-page')
      }.not_to raise_error(Selenium::WebDriver::Error::NoSuchElementError)
    end
  end
end
