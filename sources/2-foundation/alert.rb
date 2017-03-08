require 'selenium-webdriver'
require 'test/unit'

class AlertDemo < Test::Unit::TestCase
  def setup
  	@driver = Selenium::WebDriver.for :chrome
  	@base_url = "http://cookbook.seleniumacademy.com/Alerts.html"
  	@driver.manage.timeouts.implicit_wait = 30
    @driver.manage.window.maximize
    @driver.get(@base_url)
  end

  def test_alert
    @driver.find_element(id: "simple").click

    wait = Selenium::WebDriver::Wait.new(timeout: 10)
    alert = nil
    wait.until do
      alert = @driver.switch_to.alert
    end 

    assert_equal "Hello! I am an alert box!", alert.text
  
    alert.accept
  end

  def test_confirm_accept
    @driver.find_element(id: "confirm").click
    alert = @driver.switch_to.alert

    alert.accept

    dom = @driver.find_element id: 'demo'
    assert_equal "You Accepted Alert!", dom.text
  end

  def test_confirm_dismiss
    @driver.find_element(id: "confirm").click
    alert = @driver.switch_to.alert

    alert.dismiss

    dom = @driver.find_element id: 'demo'
    assert_equal "You Dismissed Alert!", dom.text
  end

  def test_prompt
    @driver.find_element(id: 'prompt').click
    alert = @driver.switch_to.alert

    alert.send_keys "Foo"

    alert.accept

    dom = @driver.find_element id: 'prompt_demo'
    assert_equal "Hello Foo! How are you today?", dom.text
  end

  def teardown
  	@driver.quit
  end
end