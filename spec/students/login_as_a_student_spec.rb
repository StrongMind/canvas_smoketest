require 'spec_helper'

context "As a student" do
  context "logging in" do
    context 'successfully' do
      include_examples "student login"

      it 'I can see the dashboad header' do
        expect {
          @driver.find_element(:class, "ic-Dashboard-header__title")
        }.to_not raise_error
      end
    end

    context 'with missing credentials' do
      before do
        @driver.get "https://courseware-staging.strongmind.com/login/canvas"
        @driver.find_element(:xpath, "//button[@type='submit']").click
      end

      it 'I see an error' do
        expect { @driver.find_element(:class, "error_text") }.to_not raise_error
      end
    end

    context "As a new student" do
      context "Logging in" do
        it "I should see the EULA"
        it 'I have to accept the EULA to continue'
        it 'I see the notification preferences alert'
        it 'I see a course invitation'
        it 'I can accept a course invitation'
        it 'I can decline a course invitation'
      end
    end
  end
end
