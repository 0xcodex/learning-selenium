require 'selenium-webdriver'
require 'test/unit'


class SelectDemo < Test::Unit::TestCase
  def setup
  	@driver = Selenium::WebDriver.for :chrome
	@base_url = "http://www.w3school.com.cn/tiy/loadtext.asp?f=html_select"

  	@driver.manage.timeouts.implicit_wait = 30
  end

  def test_select
  	@driver.get(@base_url)

  	element = @driver.find_element(css: 'body > select')
  	
  	select = Selenium::WebDriver::Support::Select.new(element)
  	select.select_by(:value, "audi")
	assert_equal "Audi", select.first_selected_option.text
  end

  def teardown
  	@driver.quit
  end
end