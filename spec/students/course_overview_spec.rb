require 'spec_helper'

describe "course overview as a student" do
  before(:all) { configure_driver }
  # after(:all)  { @driver.quit }

  include_examples "student login"

  before(:all) do
    @driver.find_element(class: 'ic-DashboardCard__header-title').click
  end

  context 'I can see the course navigation buttons' do
    it 'I can see the Home link' do
      expect { @driver.find_element(class: 'home') }.to_not raise_error
    end

    it 'I can see the modules link' do
      expect { @driver.find_element(class: 'modules') }.to_not raise_error
    end

    it 'I can see the discussion link' do
      expect { @driver.find_element(class: 'discussions') }.to_not raise_error
    end

    it 'I can see the assignment link' do
      expect { @driver.find_element(class: 'assignments') }.to_not raise_error
    end

    it 'I can see the grades link' do
      expect { @driver.find_element(class: 'grades') }.to_not raise_error
    end

    it 'I can see the people link' do
      expect { @driver.find_element(class: 'people') }.to_not raise_error
    end

    it 'I can see the pages link' do
      expect { @driver.find_element(class: 'pages') }.to_not raise_error
    end

    it 'I can see the syllabus link' do
      expect { @driver.find_element(class: 'syllabus') }.to_not raise_error
    end

    it 'I can see the sm-course-header-image' do
      expect { @driver.find_element(class: 'sm-course-header-image') }.to_not raise_error
    end

    context 'I can see the units and lessons' do

      it "I can see my in-progress unit is expanded" do
        expect { @driver.find_element(class: 'icon-arrow-open-down') }.to_not raise_error
      end

      it "I can see my in-progress lesson is expanded" do
        expect { @driver.find_element(:css, "i.icon-arrow-open-down") }.to_not raise_error
      end

      it "I can see the header column" do
        expect { @driver.find_element(class: 'sm-header-column') }.to_not raise_error
      end

      it "I can see all of my units" do
        @driver.find_elements(class: 'sm-header-column')
        expect ( @driver.find_elements(class: 'sm-header-column').length ) == 5
      end

      it "I can see the unit progress container" do
        expect { @driver.find_element(class: 'sm-unit-header_progress-container') }.to_not raise_error
      end

      it "I can see unit title" do
        expect { @driver.find_element(class: 'sm-header-row') }.to_not raise_error
      end

      it "I can see the status icon next to each lesson" do
        expect { @driver.find_element(class: 'module-item-status-icon') }.to_not raise_error
      end

      it "I can see the view calendar button" do
        expect { @driver.find_element(class: 'event-list-view-calendar') }.to_not raise_error
      end

      it "I can see what is coming up in the course" do
        expect { @driver.find_element(class: 'events_list') }.to_not raise_error
      end

      it "I can see the course stream button" do
        expect { @driver.find_element(class: 'course-options') }.to_not raise_error
      end

       it "I can see the breadcrumbs" do
        expect { @driver.find_element(class: 'ic-app-crumbs') }.to_not raise_error
      end
    end

    context 'I can access the primary student pages' do

      it "I can click and view the discussions in the course" do
        @driver.find_element(:link, "Discussions").click
        expect { @driver.find_element(class: 'discussion-list') }.to_not raise_error
      end

      it "I can click and view the homepage of the course" do
        @driver.find_element(:link, "Home").click
        expect { @driver.find_element(id: 'course_home_content') }.to_not raise_error
      end

      it "I can click and view the grades in the course" do
        @driver.find_element(:css, "a.grades").click
        expect { @driver.find_element(:id, "print-grades-button-container") }.to_not raise_error
      end

      it "I can click and view the syllabus in the course" do
        @driver.find_element(:link, "Syllabus").click
        expect { @driver.find_element(id: 'course_syllabus') }.to_not raise_error
      end
    end
  end
end
