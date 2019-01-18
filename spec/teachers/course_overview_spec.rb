require 'spec_helper'

describe "course overview as a teacher" do
  before(:all) { configure_driver }
  after(:all)  { @driver.quit }

  include_examples "teacher login"

  before(:all) do
    @driver.find_element(class: 'ic-DashboardCard__header-title').click
  end

  context 'I can interact with my modules' do
    it 'I can add a module' do
      @driver.find_element(class: 'add_module_link').click
      expect { @driver.find_element(class: 'submit_button') }.to_not raise_error
    end

    it 'I can edit and delete modules' do
      @driver.find_element(class: 'al-trigger').click
      expect { @driver.find_element(:css, "a.delete_item_link") }.to_not raise_error
      @driver.find_element(:css, "a.edit_module_link").click
      expect { @driver.find_element(class: 'submit_button') }.to_not raise_error
      expect { @driver.find_element(class: 'add_prerequisite_or_requirement_link') }.to_not raise_error
    end
  end
    it 'I can move my modules' do
      expect { @driver.find_element(:css, "i.icon-drag-handle") }.to_not raise_error
    end

    context 'I can interact with my items' do
      it 'I can add an item' do
        expect { @driver.find_element(:css, "button.add_module_item_link") }.to_not raise_error
      end

      it 'I can edit an item' do
        expect { @driver.find_element(:css, "a.edit_item_link") }.to_not raise_error
      end

      it 'I can move an item' do
        expect { @driver.find_element(:css, "a.move_module_item_link") }.to_not raise_error
      end

      it 'I can delete an item' do
        expect { @driver.find_element(:css, "a.delete_item_link") }.to_not raise_error
      end

      it 'I can choose my homepage' do
        expect { @driver.find_element(:css, "div#choose_home_page") }.to_not raise_error
      end

      it 'I can add an announcement' do
        expect { @driver.find_element(:link, "New Announcement") }.to_not raise_error
      end
    end
    context 'I can view my navigation links and teacher tools' do
      it 'I can view my strongmind course navigation' do
        expect { @driver.find_element(:css, "div.sm-course-menu") }.to_not raise_error
      end

      it 'I can see my teacher tools' do
        expect { @driver.find_element(:css, "div.sm-teacher-tools-container") }.to_not raise_error
      end
    end
  end
