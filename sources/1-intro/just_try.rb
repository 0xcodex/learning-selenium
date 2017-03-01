require 'selenium-webdriver'
require 'test/unit'

class BaiduSearch < Test::Unit::TestCase
  def setup
  	@driver = Selenium::WebDriver.for :chrome
  	@base_url = "http://baidu.com"
  	@driver.manage.timeouts.implicit_wait = 30
  end

  def test_baidu_search
  	@driver.get(@base_url)

  	element = @driver.find_element(:name, "wd")
  	element.clear

  	element.send_keys "海量通"
  	element.submit

  	wait = Selenium::WebDriver::Wait.new(timeout: 10)
  	wait.until {@driver.title.include? "海量通"}

  	sleep(5) #just let people see result

  	assert_equal "海量通_百度搜索", @driver.title
  end

  def teardown
  	#@driver.quit
  end
end