require 'spec_helper'

describe "course people as a teacher" do
  before(:all) { configure_driver }
  after(:all)  { @driver.quit }

  include_examples "teacher login"

  before(:all) do
    @driver.find_element(class: 'ic-DashboardCard__header-title').click
    @driver.find_element(:css, "a.people").click
  end

  context 'I can configure people in my course' do
    it 'I can add people to my course' do
      expect { @driver.find_element(:css, "a#addUsers") }.to_not raise_error
    end

    it 'I can control the sequence control settings for my students' do
      expect { @driver.find_element(:css, "td.seqControl") }.to_not raise_error
    end

  end
end
