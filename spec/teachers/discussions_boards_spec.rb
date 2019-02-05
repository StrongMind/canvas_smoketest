require 'spec_helper'

describe "discussion boards as a teacher" do
  before(:all) { configure_driver }
  after(:all)  { @driver.quit }

  include_examples "teacher login"

  before(:all) do
    @driver.find_element(class: 'ic-DashboardCard__header-title').click
    @driver.find_element(:css, "a.discussions").click
  end

  context 'I can view and edit my discussion boards' do
    it 'I can add discussion boards' do
      expect { @driver.find_element(:css, "a#new-discussion-btn") }.to_not raise_error
    end

    it 'I can edit a discussion title and settings' do
      @driver.find_element(:link, "Discussion: Hymn to the Nile - Hymn to the Nile").click
      expect { @driver.find_element(:css, "a.edit-btn") }.to_not raise_error
    end

    it 'I can close a discussion for comments' do
      expect { @driver.find_element(:css, "a.discussion_locked_toggler") }.to_not raise_error
    end

    it 'I can remove a discussion board' do
      expect { @driver.find_element(:css, "a.delete_discussion") }.to_not raise_error
    end

    #it 'I can access speed grader from within a discussion interface' do
    #  @driver.find_element(:css, "a.announcement_cog").click
    #  @driver.find_element(:xpath, "//*[@id='ui-id-49']").click
    #  expect { @driver.find_element(:css, "span.speedgrader-selectmenu-icon") }.to_not raise_error
    #  @driver.find_element(:css, "a.icon-gradebook").click
    #end
  end
end
