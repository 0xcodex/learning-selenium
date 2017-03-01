require 'selenium-webdriver'
require 'test/unit'

class NavigateDemo < Test::Unit::TestCase
  def setup
  	@driver = Selenium::WebDriver.for :chrome
  	@base_url = "http://baidu.com"
  	@driver.manage.timeouts.implicit_wait = 30
  end

  def test_navigate
  	@driver.get(@base_url)

  	elem = @driver.find_element(name: 'wd')
    elem.clear

    elem.send_keys("海量通")
    elem.submit

    wait = Selenium::WebDriver::Wait.new(timeout: 10)
    wait.until {@driver.title.include? "海量通"}

    @driver.navigate.back

    wait = Selenium::WebDriver::Wait.new(timeout: 10)
    wait.until {@driver.title.include? "百度"}

    assert @driver.title.include? "你就知道"

    @driver.navigate.forward

    wait = Selenium::WebDriver::Wait.new(timeout: 10)
    wait.until {@driver.title.include? "海量通"}

    assert_equal "海量通_百度搜索", @driver.title
  end

  def teardown
  	@driver.quit
  end
end