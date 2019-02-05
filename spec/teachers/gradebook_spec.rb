require 'spec_helper'

describe "gradebook as a teacher" do
  before(:all) { configure_driver }
  after(:all)  { @driver.quit }

  include_examples "teacher login"

  before(:all) do
    @driver.find_element(class: 'ic-DashboardCard__header-title').click
    @driver.find_element(:css, "a.grades").click
  end

  context 'I can view and edit my gradebook' do
    it 'I can edit and score for any student in the course' do
      expect { @driver.find_element(:css, "a.gradebook-cell-comment") }.to_not raise_error
    end

    it 'I can see an average of each student for each Gradebook Category' do
      expect { @driver.find_element(:css, "div.assignment-points-possible") }.to_not raise_error
    end

    it 'I can import and export grade data' do
      expect { @driver.find_element(:css, "i.icon-import") }.to_not raise_error
      expect { @driver.find_element(:css, "i.icon-export") }.to_not raise_error
    end

    it 'I can filter/sort gradebook data by several factors' do
      expect { @driver.find_element(:css, "button#gradebook_settings") }.to_not raise_error
    end

  end
end
