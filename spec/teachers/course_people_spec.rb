require 'spec_helper'

describe "enrollments after course starts" do
  before(:all) { configure_driver }
  # after(:all)  { @driver.quit }

  let(:user_name) {
    SecureRandom.hex(5)
  }
  let(:email) { "#{user_name}@example.com" }

  # include_examples "teacher login"
  context 'creating late starting student' do
    include_examples "admin login"

    it 'Creates an enrollment' do
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

  context 'viewing student due dates' do
    include_examples "teacher login"

    it do
      @driver.find_element(class: 'ic-DashboardCard__header-title').click
      @driver.find_element(class: 'people').click
    end
  end
end
