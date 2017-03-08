require 'selenium-webdriver'
require 'test/unit'

class Extender
  def self.highlight_element(driver, elm)
    (0..4).each do |i|
      driver.execute_script("arguments[0].setAttribute('style', arguments[1])", elm, "color: red;border: 20px solid yellow;")
      sleep(1)
      driver.execute_script("arguments[0].setAttribute('style', arguments[1])", elm, "")
    end
  end
end

class SetElementAttributeValuesDemo < Test::Unit::TestCase
  def setup
  	@driver = Selenium::WebDriver.for :chrome
  	@base_url = "http://baidu.com"
  	@driver.manage.timeouts.implicit_wait = 30
  end

  def test_highlight
  	@driver.get(@base_url)
  	dom = @driver.find_element(css: '#su')

  	Extender.highlight_element(@driver, dom)

  	assert true
    
  end

  def teardown
  	@driver.quit
  end
end