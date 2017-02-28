require 'selenium-webdriver'
require 'test/unit'

class FindElementTest < Test::Unit::TestCase
  def setup
  	@driver = Selenium::WebDriver.for :chrome
  	@base_url = "http://cookbook.seleniumacademy.com/DragDropDemo.html"
  	@driver.manage.timeouts.implicit_wait = 30
  end

  def test_find_element
  	@driver.get(@base_url)

  	source = @driver.find_element(id: "draggable")
  	target = @driver.find_element(id: "droppable")

    @driver.action.drag_and_drop(source,target).perform

  	sleep(5) #just let people see result

  	assert_equal "Dropped!", target.text
  end

  def teardown
  	@driver.quit
  end
end