require 'selenium-webdriver'
require 'test/unit'

class JQueryTest < Test::Unit::TestCase
  def setup
  	@driver = Selenium::WebDriver.for :chrome
  	@base_url = "http://mps.hailiangtong.com"
  	@driver.manage.timeouts.implicit_wait = 30
  end

  def test_jquery
  	@driver.get(@base_url)

  	element = @driver.execute_script("return jQuery.find('#username')")[0]
  	element.clear

  	element.send_keys "海量通"
  	

  	sleep(5) #just let people see result

  	assert_equal "登录-MPS管理系统", @driver.title #useless
  end

  def teardown
  	@driver.quit
  end
end