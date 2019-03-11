require 'spec_helper'

describe "account as a student" do
  before(:all) { configure_driver }
  after(:all)  { @driver.quit unless ENV['KEEP_BROWSERS'] }

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

    it 'I can add a new contact method' do
      @driver.get "https://courseware-staging.strongmind.com/profile/settings"
      @driver.find_element(:link, "Email Address").click
      @driver.find_element(:id, "ui-id-1").click
      @driver.find_element(:id, "communication_channel_email").click
      @driver.find_element(:id, "communication_channel_email").clear
      @driver.find_element(:id, "communication_channel_email").send_keys "test@test.com"
      @driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='Email Address'])[2]/following::button[1]").click
      @driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='Register Email'])[1]").click
    end
  end

  context 'I can access and update my calendar' do
    it 'I can view my calendar' do
      @driver.get "https://courseware-staging.strongmind.com/calendar"
      expect { @driver.find_element(:css, "div.calendar") }.to_not raise_error
    end

    it 'I can add an event to my calendar' do
      @driver.get "https://courseware-staging.strongmind.com/calendar"
      @driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='Agenda'])[1]/following::i[1]").click
      expect { @driver.find_element(:css, "button.event_button").click }.to_not raise_error  # this doesn't actually tell us we can add an event...
    end

    it 'I can view events and due dates for assignments in my courses - WHEN THIS FAILS, CHANGE THE DUE DATES IN RTC-102' do
      # FIXME set up in a brittle way. fix this with factories to set up a course
      expect { @driver.find_element(:css, "i.icon-assignment") }.to_not raise_error
      expect { @driver.find_element(:css, "span.fc-time") }.to_not raise_error
      expect { @driver.find_element(:css, "span.fc-title") }.to_not raise_error
    end
  end

  context 'I can access and view my inbox' do
    it 'I can view my messages in the inbox' do
      @driver.get "https://courseware-staging.strongmind.com/inbox"
      expect { @driver.find_element(:css, "ul.messages") }.to_not raise_error
    end

    it 'I can send a message' do
      @driver.get "https://courseware-staging.strongmind.com/inbox"
      @driver.find_element(:id, "compose-btn").click
      expect { @driver.find_element(:css, "button.send-message") }.to_not raise_error
      @driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='Compose Message'])[1]/following::i[1]").click

    end
  end

  context 'I can access and change my notification settings' do

    it 'I can change my notification settings' do
      @driver.get "https://courseware-staging.strongmind.com/profile/communication"
      @driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='Logout'])[1]/following::a[1]").click
      @driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='Due Date'])[1]/following::i[1]").click
      @driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='Send daily summary'])[2]/following::i[1]").click
    end

  end
end
