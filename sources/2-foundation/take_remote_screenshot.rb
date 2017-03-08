require 'selenium-webdriver'

driver = Selenium::WebDriver.for :remote, url: 'http://localhost:4444/wd/hub', desired_capabilities: :chrome

driver.get "http://mps.hailiangtong.com"

driver.save_screenshot('/Users/liyuhang/pics/pic_remote.png')

driver.quit