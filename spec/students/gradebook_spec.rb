require 'spec_helper'

describe "gradebook as a student" do
  before(:all) { configure_driver }
  after(:all)  { @driver.quit unless ENV['KEEP_BROWSERS'] }

  include_examples "student login"

  before(:all) do
    @driver.find_element(class: 'ic-DashboardCard__header-title').click
    @driver.find_element(:css, "a.grades").click
  end

  context 'I can see my gradebook content' do
    it 'I can see my all of my assignment items and my performance on the item' do
      expect { @driver.find_element(:css, "table#grades_summary") }.to_not raise_error
      expect { @driver.find_element(:css, "th.assignment_score") }.to_not raise_error
    end

    it 'I can click an item to be navigated to it' do
      @driver.find_element(:link, "Pre-assessment 01").click
      expect { @driver.find_element(class: 'save_comment_button') }.to_not raise_error
      @driver.find_element(:css, "a.grades").click
    end

    it 'I can see my overall grade' do
      expect { @driver.find_element(class: 'final_grade') }.to_not raise_error
      expect { @driver.find_element(:id, "submission_final-grade") }.to_not raise_error
    end

    it 'I can toggle between calculate based on graded assessments or all assessments' do
      @driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='Total'])[2]/following::label[1]").click
      @driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='Total'])[2]/following::label[1]").click
    end

#    it 'I can edit my grade in what-if mode and see how my overall grade changes' do
#      @driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='Jul 3 by 12:59am'])[2]/following::span[2]").click
#      @driver.find_element(:id, "grade_entry").clear
#      @driver.find_element(:id, "grade_entry").send_keys "20"
#      @driver.find_element(:id, "grade_entry").send_keys :enter
#      @driver.find_element(:id, "revert-all-to-actual-score").click
#    end
#
    it 'I can click the view all details button' do
      @driver.find_element(:id, "show_all_details_button").click
    end


    it "contains a submitted assignment" do
      submitted_at = @driver.find_element(:css, "#submission_51383 td.due:nth-of-type(2)")
      sleep(1)
      expect(submitted_at.text).to eq("Nov 8, 2018 at 10:41am")
    end
  end
end
