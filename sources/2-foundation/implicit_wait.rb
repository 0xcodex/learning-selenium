require 'selenium-webdriver'
require 'test/unit'

class ImplicitWait < Test::Unit::TestCase
  def setup
  	@driver = Selenium::WebDriver.for :chrome
  	@base_url = "http://cookbook.seleniumacademy.com/AjaxDemo.html"
  	@driver.manage.timeouts.implicit_wait = 10
  end

  def test_implicit_wait
  	@driver.get(@base_url)

  	@driver.find_element(link_text: 'Page 4').click

    dom = @driver.find_element(id: 'page4')

    assert_true dom.text.include? "Nunc nibh tortor"
  end

  def teardown
  	@driver.quit
  end
end