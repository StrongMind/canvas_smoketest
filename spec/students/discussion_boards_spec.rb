require 'spec_helper'

describe "discussion boards as a student" do
  include_examples "student login"

  before(:all) do
    @driver.find_element(class: 'ic-DashboardCard__header-title').click
    @driver.find_element(:css, "a.discussions").click
  end

  context 'I can see the discussion board content' do
    it 'I can see the search bar' do
      expect { @driver.find_element(:css, "input#searchTerm") }.to_not raise_error
    end

    it 'I can add a post' do
      @driver.find_element(:css, "a#new-discussion-btn").click
      @driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='Cancel'])[3]/following::button[1]").click
      expect { @driver.find_element(class: 'message') }.to_not raise_error
    end

    it 'I can subscribe and unsubscribe from my post' do
      expect { @driver.find_element(class: 'btn-success') }.to_not raise_error
      expect { @driver.find_element(:css, ".topic-unsubscribe-button") }.to_not raise_error
    end

    it 'I can edit my post' do
      @driver.find_element(:css, "a.edit-btn").click
      @driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='Cancel'])[3]/following::button[1]").click
    end

    it 'I can delete my post' do
      sleep(3)
      @driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='Press the comma key or shift + question mark to see a list of keyboard shortcuts'])[1]/following::i[3]").click
      @driver.find_element(:id, "ui-id-3").click
      close_alert_and_get_its_text
    end

    it 'I can see my unread and read posts' do
      expect { @driver.find_element(:css, "input#onlyUnread") }.to_not raise_error
    end

    it 'I can see posts and replies in a hierarchal manner' do
      sleep(3)
      @driver.find_element(:link, "Discussion: Hymn to the Nile - Hymn to the Nile").click
      expect { @driver.find_element(:css, "ul.discussion-entries") }.to_not raise_error
    end

    it 'I can reply to a discussion post' do
      @driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='Expand replies'])[1]/following::span[1]").click
      @driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='Cancel'])[1]/following::button[1]").click
    end

  end
end
