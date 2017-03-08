require 'selenium-webdriver'
require 'test/unit'

class Extender
  def self.custom_attr(driver, elm, attr_name, attr_val)
  	#driver = elm.ref

  	driver.execute_script("arguments[0].setAttribute(arguments[1],arguments[2])", 
  		elm, 
  		attr_name, 
  		attr_val)
  end
end

class SetElementAttributeValuesDemo < Test::Unit::TestCase
  def setup
  	@driver = Selenium::WebDriver.for :chrome
  	@base_url = "http://baidu.com"
  	@driver.manage.timeouts.implicit_wait = 30
  end

  def test_set_element_attribute_values
  	@driver.get(@base_url)
  	dom = @driver.find_element(name: 'wd')

  	assert dom.attribute('data-test').nil?

  	Extender.custom_attr(@driver, dom, 'data-test', "this is value")

  	assert_equal  "this is value", dom.attribute('data-test')
    
  end

  def teardown
  	@driver.quit
  end
end