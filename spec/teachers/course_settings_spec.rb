require 'spec_helper'

describe "course settings as a teacher" do
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
      @driver.find_element(:css,"a.import_content").click
      expect { @driver.find_element(:css, "div.control-group") }.to_not raise_error
    end

    it 'I can copy a course via import menu' do
      expect { @driver.find_element(:css, "select#chooseMigrationConverter > option:nth-child(2)") }.to_not raise_error
    end

    it 'I can export the course' do
      @driver.find_element(:css, "a.settings").click
      @driver.find_element(:css,"aside#right-side > div > a:nth-child(7)").click
      expect { @driver.find_element(:css, "form#exporter_form") }.to_not raise_error
    end
  end

  context 'I can configure my course navigation and options' do
    it 'I can choose which navigation items a student will see' do
      @driver.find_element(:css, "a.settings").click
      @driver.find_element(:css,"li#navigation_tab").click
      expect { @driver.find_element(:css, "ul#nav_enabled_list") }.to_not raise_error
      expect { @driver.find_element(:css, "ul#nav_disabled_list") }.to_not raise_error
    end

    it 'I can view edit and add sections to the course' do
      @driver.find_element(:css, "li#sections_tab").click
      expect { @driver.find_element(:css,"input#course_section_name") }.to_not raise_error
    end

    it 'I can edit and add apps tied to the course' do
      @driver.find_element(:css, "a#tab-tools-link").click
      expect { @driver.find_element(:css, "span.AddExternalToolButton") }.to_not raise_error
      expect { @driver.find_element(:css, "div.ExternalToolsTable") }.to_not raise_error
    end

    it 'I can change feature options for a course' do
      @driver.find_element(:css, "li#feature_flags_tab").click
      expect { @driver.find_element(:css, "div.course-feature-flags") }.to_not raise_error
    end
  end
end
