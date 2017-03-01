require 'selenium-webdriver'
require 'test/unit'

class CookieDemo < Test::Unit::TestCase
  def setup
  	@driver = Selenium::WebDriver.for :chrome
  	@base_url = "http://baidu.com"
  	@driver.manage.timeouts.implicit_wait = 30
  end

  def test_cookie
  	@driver.get(@base_url)

  	@driver.manage.add_cookie({ 
      name: "test1",
      value: "1"})
    
    cookie = @driver.manage.cookie_named("test1")

    assert_equal "1", cookie[:value]
  end

  def teardown
  	@driver.quit
  end
end