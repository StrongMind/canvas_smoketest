require 'spec_helper'

describe "A student viewing a course card" do
  before(:all) { configure_driver }
  after(:all)  { @driver.quit }

  include_examples "student login"

  it 'I can see a title' do
    expect {
      @driver.find_element(class: 'ic-DashboardCard__header-title')
    }.to_not raise_error
  end

  it 'I can see a subtitle' do
    expect {
      @driver.find_element(class: 'ic-DashboardCard__header-subtitle')
    }.to_not raise_error
  end

  it 'I can see a letter grade' do
    expect {
      @driver.find_element(class: 'sm-DashboardCard__course_grade')
    }.to_not raise_error
  end

  it 'I can see a progress bar' do
    expect {
      @driver.find_element(class: 'sm-DashboardCard__progress-container')
    }.to_not raise_error
  end

  context 'navigation buttons' do
    it "I can see announcements" do
      expect {
        @driver.find_element(class: 'icon-announcement')
      }.to_not raise_error
    end

    it "I can see assignments" do
      expect {
        @driver.find_element(class: 'icon-assignment')
      }.to_not raise_error
    end
    it "I can see discussions" do
      expect {
        @driver.find_element(class: 'icon-discussion')
      }.to_not raise_error
    end
    it "I can see folder" do
      expect {
        @driver.find_element(class: 'icon-folder')
      }.to_not raise_error
    end
  end

  it "I can change the course nickname" do
    @driver.find_element(class: 'ic-DashboardCard__header-button').click
    nickname_field = @driver.find_element(id: 'NicknameInput')

    name = 'new_course_name' + Time.now.strftime('%s')
    nickname_field.clear
    nickname_field.send_keys(name)
    @driver.find_element(class: 'Button--primary').click
    @driver.navigate.refresh
    sleep(1)
    expect(@driver.find_element(class: 'ic-DashboardCard__header-title span').text).to eq(name)
  end
  it "I can change the course color"
end
