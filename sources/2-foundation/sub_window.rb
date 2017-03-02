require 'selenium-webdriver'
require 'test/unit'

class SubWindowDemo < Test::Unit::TestCase
  def setup
  	@driver = Selenium::WebDriver.for :chrome
  	@base_url = "http://cookbook.seleniumacademy.com/Config.html"
  	@driver.get(@base_url)

    @driver.manage.window.maximize
  end

  def test_sub_window
  	parent_window_id = @driver.window_handle

    @driver.find_element(id: 'helpbutton').click

    @driver.switch_to.window('HelpWindow')

    assert_equal "Help", @driver.title

    @driver.close

    @driver.switch_to.window(parent_window_id)
    assert_equal "Build my Car - Configuration", @driver.title 
  end

  def teardown
  	@driver.quit
  end
end