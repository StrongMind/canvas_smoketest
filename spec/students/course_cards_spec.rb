require 'spec_helper'

context "As a student" do
  context "viewing a course card" do
    include_examples "student login"

    it 'I can see the title' do
      expect { @driver.find_element(class: 'ic-DashboardCard__header-title') }.to_not raise_error
    end

    it 'I can see the subtitle' do
      expect { @driver.find_element(class: 'ic-DashboardCard__header-subtitle') }.to_not raise_error
    end

    it 'I can see the letter grade' do
      expect { @driver.find_element(class: 'sm-DashboardCard__course_grade') }.to_not raise_error
    end

    it 'I can see the progress bars' do
      expect { @driver.find_element(class: 'sm-DashboardCard__progress-container') }.to_not raise_error
    end

    it 'I can see the navigation buttons' do
      expect { @driver.find_element(class: 'icon-announcement') }.to_not raise_error
      expect { @driver.find_element(class: 'icon-assignment') }.to_not raise_error
      expect { @driver.find_element(class: 'icon-discussion') }.to_not raise_error
      expect { @driver.find_element(class: 'icon-folder') }.to_not raise_error
    end

    it "I can change the course nickname"
    it "I can change the course color"
  end
end
