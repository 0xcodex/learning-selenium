require 'selenium-webdriver'
require 'test/unit'

class LoadJQueryTest < Test::Unit::TestCase
  def setup
  	@driver = Selenium::WebDriver.for :chrome
  	@base_url = "http://www.gnu.org/"
  	@driver.manage.timeouts.implicit_wait = 30
  end

  def test_load_jquery
  	@driver.get(@base_url)

  	load_jquery = @driver.execute_script("return typeof(jQuery) != 'undefined'")
  	
    assert_false load_jquery

injected_jquery_seg =<<-INJECT
  var headId = document.getElementsByTagName('head')[0]
  var newScript = document.createElement('script')
  newScript.src = 'http://libs.baidu.com/jquery/1.11.1/jquery.min.js'
  headId.appendChild(newScript)
INJECT

    
    @driver.execute_script(injected_jquery_seg)
    sleep(10)
    assert_true @driver.execute_script("return typeof(jQuery) != 'undefined'")

  end

  def teardown
  	@driver.quit
  end
end