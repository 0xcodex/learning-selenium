require 'selenium-webdriver'
require 'test/unit'

class FrameDemo < Test::Unit::TestCase
  def setup
  	@driver = Selenium::WebDriver.for :chrome
  	@base_url = "http://cookbook.seleniumacademy.com/Frames.html"
  	@driver.manage.timeouts.implicit_wait = 30
    @driver.manage.window.maximize
    @driver.get(@base_url)
  end

  def test_frame 
    @driver.switch_to.frame('left') #by id

    dom = @driver.find_element tag_name: 'p'
    assert_equal "This is Left Frame", dom.text

    @driver.switch_to.default_content

    @driver.switch_to.frame('right')

    dom = @driver.find_element tag_name: 'p'
    assert_equal "This is Right Frame", dom.text

    @driver.switch_to.default_content
  end

  def test_frame_by_index
    @driver.switch_to.frame(1)

    dom = @driver.find_element tag_name: 'p'
    assert_equal "This Frame doesn't have id or name", dom.text

    @driver.switch_to.default_content    
  end

  def test_frame_by_contents
    frames = @driver.find_elements tag_name: 'frame'

    frames.each do|frame|
      @driver.switch_to.frame(frame)

      title = @driver.title
      if title.eql? "Frame B"
        dom = @driver.find_element tag_name: 'p'
        assert_equal "This is Left Frame", dom.text
        break;
      else
        @driver.switch_to.default_content
      end
    end

    @driver.switch_to.default_content
  end

  def test_iframe
    current_window = @driver.window_handle
    @driver.switch_to.frame('right')
    frame = @driver.find_element tag_name: 'iframe'

    @driver.switch_to.frame(frame)
    click_btn = @driver.find_element id: 'follow-button'

    click_btn.click

    @driver.window_handles.each do |window_id|
      @driver.switch_to.window(window_id)
      if @driver.title.eql? "Unmesh Gundecha (@upgundecha) on Twitter"
        assert_true "Twitter Login Popup Window Found", true
        @driver.close
        break
      end
    end
  end


  def teardown
    @driver.close
  	@driver.quit
  end
end