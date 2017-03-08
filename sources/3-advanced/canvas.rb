require 'selenium-webdriver'
require 'test/unit'

class CanvasDemo < Test::Unit::TestCase
  def setup
  	@driver = Selenium::WebDriver.for :chrome
  	@base_url = "http://cookbook.seleniumacademy.com/html5canvasdraw.html"
  	@driver.manage.timeouts.implicit_wait = 30
    @driver.get(@base_url)
  end

  def test_canvas
  	canvas = @driver.find_element id: "imageTemp"

    select = Selenium::WebDriver::Support::Select.new(@driver.find_element id: 'dtool')
    select.select_by(:value, "pencil")

    @driver.action.click_and_hold(canvas)
      .move_by(10,50)
      .move_by(50,10)
      .move_by(-10,-50)
      .move_by(-50,-10).release.perform

    @driver.save_screenshot('/Users/liyuhang/pics/canvas.png')

    assert true

  end

  def teardown
  	@driver.quit
  end
end