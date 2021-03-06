RSpec.shared_examples "teacher login" do
  before(:all) do
    @driver.get "https://courseware-staging.strongmind.com/login/canvas"
    @driver.find_element(:name, "pseudonym_session[unique_id]").click
    @driver.find_element(:name, "pseudonym_session[unique_id]").clear
    @driver.find_element(:name, "pseudonym_session[unique_id]").send_keys "regressionteacher1"
    @driver.find_element(:name, "pseudonym_session[password]").clear
    @driver.find_element(:name, "pseudonym_session[password]").send_keys "Test1234"
    @driver.find_element(:id, "login_form").submit
  end
end
