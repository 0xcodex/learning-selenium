require 'selenium-webdriver'
require 'logger'


class NavigationListener < Selenium::WebDriver::Support::AbstractEventListener
  def initialize(log)
    @log = log
  end

  def before_navigate_to(url, driver)
    @log.info "navigating to #{url}"
  end

  def after_navigate_to(url, driver)
    @log.info "done navigating to #{url}"
  end
end

logger = Logger.new(STDOUT)

listener = NavigationListener.new(logger)
driver = Selenium::WebDriver.for :chrome, :listener => listener

driver.get('http://baidu.com')

driver.quit