require 'spec_helper'

describe "school settings as an admin" do
  before(:all) { configure_driver }
  after(:all)  { @driver.quit }

  include_examples "admin login"

  before(:all) do
    @driver.find_element(:css, "a#global_nav_accounts_link").click
    @driver.find_element(:link_text, "Staging School").click
  end

  context 'I can configure my school settings' do
    it 'I can create a Course' do
      expect { @driver.find_element(:css, "a.add_course_link") }.to_not raise_error
    end

    it 'I can see all courses in the system when browsing to Admin then Courses' do
      expect { @driver.find_element(:css, "ul.courses") }.to_not raise_error
    end

    it 'I can add an admin account' do
      @driver.find_element(:css, "a.settings").click
      @driver.find_element(:css, "a#tab-users-link").click
      expect { @driver.find_element(:css, "a.add_users_link") }.to_not raise_error
    end

    it 'I can toggle Auto Due Date Setting' do
      @driver.find_element(:css, "a.settings").click
      @driver.find_element(:css, "a#tab-features-link").click
      expect { @driver.find_element(:css, "div.auto_due_dates") }.to_not raise_error
    end

    it 'I can toggle Auto Zero Setting' do
      @driver.find_element(:css, "a.settings").click
      @driver.find_element(:css, "a#tab-features-link").click
      expect { @driver.find_element(:css, "div.zero_out_past_due") }.to_not raise_error
    end

    it 'I can toggle Hide Inbox Setting' do
      @driver.find_element(:css, "a.settings").click
      @driver.find_element(:css, "a#tab-features-link").click
      expect { @driver.find_element(:css, "div.hide_inbox") }.to_not raise_error
    end

  end
end
