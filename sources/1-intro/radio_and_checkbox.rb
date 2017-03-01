require 'selenium-webdriver'
require 'test/unit'


class Demo < Test::Unit::TestCase
  def setup
  	@driver = Selenium::WebDriver.for :chrome
	  @base_url = "http://hailiangtong.com/test.html"

  	@driver.manage.timeouts.implicit_wait = 30
  end

  def test_radio
  	@driver.get(@base_url)

  	element = @driver.find_element(css: "input[value='3']")
  	
    assert_false element.selected?

    element.click

	  assert_true element.selected?
  end

  def test_checkbox
    @driver.get(@base_url)

    element = @driver.find_element(name: 'Fruit1')
    
    apple = @driver.find_element(css: "input[value='apple']")
    banana = @driver.find_element(css: "input[value='banana']")

    assert_false apple.selected?
    assert_false banana.selected?

    apple.click
    banana.click

    assert_true apple.selected?
    assert_true banana.selected?
  end

  def teardown
  	@driver.quit
  end
end