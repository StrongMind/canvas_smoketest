require 'spec_helper'

describe "enrollments after course starts" do
  before(:all) { configure_driver }
  after(:all)  { @driver.quit unless ENV['KEEP_BROWSERS'] }

  let(:user_name) {
    SecureRandom.hex(5)
  }
  let(:email) { "#{user_name}@example.com" }

  # include_examples "teacher login"
  context 'creating late starting student' do
    include_examples "admin login"

    it 'Creates a starter' do
      @driver.find_element(class: 'ic-DashboardCard__header-title').click
      @driver.find_element(class: 'people').click
      @driver.find_element(id: 'addUsers').click
      @driver.find_element(tag_name: 'textarea').send_keys(email)
      @driver.find_element(id: 'addpeople_next').click
      @driver.find_element(css: "button[data-address]").click
      @driver.find_element(css: "input[data-address]").send_keys("#{user_name} smoketest")
      @driver.find_element(id: 'addpeople_next').click
      @driver.find_element(id: 'addpeople_next').click
      @driver.find_element(css: 'form[ref="logoutForm"]').submit
    end
  end

  context 'Adds another person and can delete them' do
    include_examples "admin login"

    it 'Creates and deletes an enrollment' do
      @driver.find_element(class: 'ic-DashboardCard__header-title').click
      @driver.find_element(class: 'people').click

      @driver.find_element(id: 'addUsers').click
      @driver.find_element(tag_name: 'textarea').send_keys(email)
      @driver.find_element(id: 'addpeople_next').click
      @driver.find_element(css: "button[data-address]").click
      @driver.find_element(css: "input[data-address]").send_keys("#{user_name} smoketest")
      @driver.find_element(id: 'addpeople_next').click
      @driver.find_element(id: 'addpeople_next').click

      course_id = @driver.current_url.split("/")[-2]
      @driver.get("https://courseware-staging.strongmind.com/courses/#{course_id}/conclude_users")
      @driver.find_element(css: '[name="enrollment_ids[]"]').click
      @driver.find_element(css: '[action*="conclude_users"]').submit
    end
  end

  context 'viewing student due dates' do
    include_examples "teacher login"

    it do
      @driver.find_element(class: 'ic-DashboardCard__header-title').click
      @driver.find_element(class: 'people').click
    end
  end

  context 'while masquerading' do
    include_examples "admin login"

    it "does not update last_activity_at" do
      @driver.get("https://courseware-staging.strongmind.com/users/640")
      wait_for_link("become_user_id")
      @driver.find_element(css: '[href*="?become_user_id=640"]').click
      wait_for_link("masquerade")
      @driver.find_element(css: '[href*="masquerade"]').click

      @driver.find_element(class: 'ic-DashboardCard__header-title').click
      @driver.find_element(class: 'people').click

      wait_for_link("/1/masquerade")
      @driver.find_element(css: '[href*="masquerade"]').click

      wait_for_link("564")
      expect(@driver.page_source).to include("Mar 29 at 10:52am")
    end

  end
end
