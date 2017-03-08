require 'selenium-webdriver'
require 'test/unit'
require 'mini_magick'

def capturing_element(driver, elm)
  content = driver.screenshot_as(:png)
  width = elm.size.width
  height = elm.size.height

  point = elm.location

  image = MiniMagick::Image.read(content,"png")
  image.crop "#{width}x#{height}+#{point.x}+#{point.y}"
  image.write('/Users/liyuhang/pics/elm.png')

end

class SetElementAttributeValuesDemo < Test::Unit::TestCase
  def setup
  	@driver = Selenium::WebDriver.for :chrome
  	@base_url = "http://baidu.com"
  	@driver.manage.timeouts.implicit_wait = 30
  end

  def test_capturing
  	@driver.get(@base_url)
  	dom = @driver.find_element(css: '#su')

  	capturing_element(@driver, dom)

  	assert true
    
  end

  def teardown
  	@driver.quit
  end
end