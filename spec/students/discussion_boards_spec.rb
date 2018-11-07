require 'spec_helper'

describe "discussion boards as a student" do
  before(:all) { configure_driver }
  after(:all)  { @driver.quit }

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
      @driver.find_element(class: 'topic-unsubscribe-button').click
    end

    it 'I can edit my post' do
      @driver.find_element(:css, "a.edit-btn").click
      @driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='Cancel'])[3]/following::button[1]").click
    end

    it 'I can delete my post' do
      @driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='Press the comma key or shift + question mark to see a list of keyboard shortcuts'])[1]/following::i[3]").click
      @driver.find_element(:id, "ui-id-3").click
      @accept_next_alert = true
    end
  end
end
