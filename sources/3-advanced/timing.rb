require 'selenium-webdriver'
require 'test/unit'

class TimingDemo < Test::Unit::TestCase
  def setup
  	@driver = Selenium::WebDriver.for :chrome
  	@base_url = "http://baidu.com"
  	@driver.manage.timeouts.implicit_wait = 30
  end

  def test_capturing
  	@driver.get(@base_url)
  	
    load_event_end = @driver.execute_script("return window.performance.timing.loadEventEnd")
    
    navigate_start = @driver.execute_script("return window.performance.timing.navigationStart")

    str = "页面载入用了 #{ (load_event_end - navigate_start)/1000.0 } 秒"
    puts str
    assert_false str.nil?
  end

  def teardown
  	@driver.quit
  end
end