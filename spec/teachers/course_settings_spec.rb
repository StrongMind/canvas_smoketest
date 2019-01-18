require 'spec_helper'

describe "course settings as a student" do
  before(:all) { configure_driver }
  after(:all)  { @driver.quit }

  include_examples "teacher login"

  before(:all) do
    @driver.find_element(class: 'ic-DashboardCard__header-title').click
    @driver.find_element(:css, "a.settings").click
  end

  context 'I can see my course settings' do
    it 'I can see my course details' do
      expect { @driver.find_element(:css, "form#course_form") }.to_not raise_error
    end

    it 'I can update my course image, name, and course code' do
      expect { @driver.find_element(:css, "input#course_name") }.to_not raise_error
      expect { @driver.find_element(:css, "div.CourseImageSelector") }.to_not raise_error
      expect { @driver.find_element(:css, "input#course_course_code") }.to_not raise_error
    end

    it 'I can set my start and end date for the course' do
      expect { @driver.find_element(:css, "input#course_start_at") }.to_not raise_error
      expect { @driver.find_element(:css, "input#course_conclude_at") }.to_not raise_error
    end

    it 'I can view and update all of my course settings' do
      expect { @driver.find_element(:css, "div#course_details_tabs") }.to_not raise_error
    end
  end

  context 'I can copy a course' do
    it 'I can import a course cartridge' do
      expect { @driver.find_element(:css, "select#ChooseMigrationConverter") }.to_not raise_error
    end

    it 'I can copy a course via import menu' do
      @driver.find_element(class: 'import_content').click
      expect { @driver.find_element(:css, "select#ChooseMigrationConverter") }.to_not raise_error
    end

    it 'I can export the course' do
      expect { @driver.find_element(:css, "i.icon-download") }.to_not raise_error
      expect { @driver.find_element(:css, "div.export_messages") }.to_not raise_error
    end

    #it 'I can re-import an exported course and the attempt count is maintained' do
      #expect { @driver.find_element(:css, "div#course_details_tabs") }.to_not raise_error
    #end

  end
end
