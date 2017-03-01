require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome

driver.get "http://mps.hailiangtong.com"

driver.save_screenshot('/Users/liyuhang/pics/pic.png')

