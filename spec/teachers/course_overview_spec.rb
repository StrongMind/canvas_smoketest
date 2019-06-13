require 'spec_helper'

describe "course overview as a teacher" do
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

    it 'I can move my modules' do
      expect { @driver.find_element(:css, "i.icon-drag-handle") }.to_not raise_error
    end

    context 'I can interact with my items' do
      it 'I can add an item' do
        expect { @driver.find_element(:css, "button.add_module_item_link") }.to_not raise_error
      end
    end
  end
end
