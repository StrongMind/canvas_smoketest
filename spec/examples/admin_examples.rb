RSpec.shared_examples 'admin login' do
  before(:all) do
    @driver.get 'https://courseware-staging.strongmind.com/login/canvas'
    @driver.find_element(:name, 'pseudonym_session[unique_id]').click
    @driver.find_element(:name, 'pseudonym_session[unique_id]').clear
    @driver.find_element(:name, 'pseudonym_session[unique_id]').send_keys 'canvas-admin@example.com'
    @driver.find_element(:name, 'pseudonym_session[password]').clear
    raise 'Missing Admin Password (hint, should be in ADMIN_PASSWORD environment variable)'
    @driver.find_element(:name, 'pseudonym_session[password]').send_keys ENV['ADMIN_PASSWORD']
    @driver.find_element(:id, 'login_form').submit
    wait_for_link('courses')
  end
end
