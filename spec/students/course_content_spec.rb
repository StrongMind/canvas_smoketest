require 'spec_helper'

describe "course content as a student" do
  before(:all) { configure_driver }
  after(:all)  { @driver.quit }

  include_examples "student login"

  before(:all) do
    @driver.find_element(class: 'ic-DashboardCard__header-title').click
    @driver.find_element(:css, "a.ig-title").click
  end

  context 'I can see the content' do
    it 'I can see the iframe' do
      expect { @driver.find_element(class: 'sm_iframe') }.to_not raise_error
    end

    it 'I can see the progress container' do
      expect { @driver.find_element(class: 'sm-module-footer') }.to_not raise_error
    end

    it 'I can see the Next and Previous buttons and they work' do
      @driver.find_element(:css, "a.module-sequence-footer-button--next").click
    end

    it 'I can see all of activities in the lesson on the progress bar' do
      expect { @driver.find_element(class: 'sm-module-footer__nav') }
      expect ( @driver.find_elements(:css, "ul.sm-module-footer__nav > li").length ) == 7
    end

    it 'I can click on an item in the progress bar and attempt to be navigated to it' do
      @driver.find_element(:css, "a.module-sequence-footer-button--next").click
      @driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='Install the Video Plugin'])[1]/preceding::a[2]").click
    end

  end
end
