require 'spec_helper'

describe "speedgrader as a teacher" do
  before(:all) { configure_driver }
  after(:all)  { @driver.quit }

  include_examples "teacher login"

  before(:all) do
    @driver.find_element(class: 'todo-details').click
  end

  context 'I can view students in the course within Speedgrader' do

    it 'I  can toggle through the students using the dropdown' do
      expect { @driver.find_element(:css, "span.ui-selectmenu-item-header") }.to_not raise_error
    end

    it 'I can toggle through the students using the arrows' do
      expect { @driver.find_element(:css, "i.next") }.to_not raise_error
      expect { @driver.find_element(:css, "i.prev") }.to_not raise_error
    end

    #it 'I can see the the add attempt button for imported courses' do
    #  expect { @driver.find_element(:css, "input#course_conclude_at") }.to_not raise_error
    #end

    #it 'I can  can click add attempt to give the student one more attempt on the assessment' do
    #  expect { @driver.find_element(:css, "input#course_conclude_at") }.to_not raise_error
    #end

    #it 'I can click the name of the course to access the Home tab of the Course' do
    #  @driver.find_element(:css, "a#context_title").click
    #  expect { @driver.find_element(:css, "btn.add_module_link") }.to_not raise_error
    #end
  end

  context 'I can grade assignments within Speedgrader' do

    it 'I can grade an item' do
      expect { @driver.find_element(:css, "input#grading-box-extended") }.to_not raise_error
    end

    it 'I can change the grade on a previously graded item ' do
      expect { @driver.find_element(:css, "div#grade_container") }.to_not raise_error
    end

    it 'I can leave a comment on an assignment' do
      expect { @driver.find_element(:css, "textarea#speedgrader_comment_textarea") }.to_not raise_error
    end

    it 'I can use the speech to text button to leave a comment' do
      expect { @driver.find_element(:css, "a#speech_recognition_button") }.to_not raise_error
    end

    it 'I can add an attachment to an assignment comment' do
      expect { @driver.find_element(:css, "button#add_attachment") }.to_not raise_error
    end

    it 'I can can see and use the four buttons in the top bar' do
      expect { @driver.find_element(:css, "i.icon-gradebook") }.to_not raise_error
      expect { @driver.find_element(:css, "i.icon-unmuted") }.to_not raise_error
      expect { @driver.find_element(:css, "button.gradebookActions__Button") }.to_not raise_error
      expect { @driver.find_element(:css, "i.icon-settings") }.to_not raise_error
    end

    #it 'I can click View Full Discussion to access the full thread' do
    #  expect { @driver.find_element(:id, "discussion_view_link") }.to_not raise_error
    #end

    it 'I can view the three data point Graded, Average, and Student Number in the header bar' do
      expect { @driver.find_element(:css, "div#x_of_x_graded") }.to_not raise_error
      expect { @driver.find_element(:css, "div#average_score") }.to_not raise_error
      expect { @driver.find_element(:css, "div#x_of_x_students_frd") }.to_not raise_error
    end
  end

end
