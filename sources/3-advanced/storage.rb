require 'selenium-webdriver'
require 'test/unit'

class StorageDemo < Test::Unit::TestCase
  def setup
  	@driver = Selenium::WebDriver.for :chrome
  	@base_url = "http://baidu.com"
  	@driver.manage.timeouts.implicit_wait = 30
  end

  def test_storage
  	@driver.get(@base_url)

    last_name = @driver.execute_script('return localStorage.lastname')

    assert last_name.nil?

    @driver.execute_script('localStorage.lastname = "Tom"')

    assert_equal "Tom", @driver.execute_script('return localStorage.lastname')
  end

  def teardown
  	@driver.quit
  end
end