require 'spec_helper'

describe "account as a student" do
  before(:all) { configure_driver }
  after(:all)  { @driver.quit }

  include_examples "student login"

  before(:all) do
    @driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='Inbox'])[1]/following::i[2]").click
    @driver.find_element(:link, "Profile").click
  end

  context 'I can access and update my account settings' do
    it 'I can update my profile picture from the Profile Menu' do
      @driver.find_element(:css, "a.profile-link").click
      expect { @driver.find_element(:css, "a.select-photo-link") }.to_not raise_error
      @driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='Select Profile Picture'])[1]/following::span[1]").click
    end

    xit 'I can add a new contact method' do
      @driver.get "https://courseware-staging.strongmind.com/profile/settings"
      @driver.find_element(:link, "Email Address").click
      @driver.find_element(:id, "communication_channel_email").click
      @driver.find_element(:id, "communication_channel_email").clear
      @driver.find_element(:id, "communication_channel_email").send_keys "regression1@strongmind.com"
      @driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='Email Address'])[2]/following::button[1]").click
      @driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='Re-Send Confirmation'])[2]/following::button[1]").click
      expect { @driver.find_element(:css, "a.email_channel") }.to_not raise_error
    end

  end
end