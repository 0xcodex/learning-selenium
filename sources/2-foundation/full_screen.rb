require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome

driver.get "http://mps.hailiangtong.com"

driver.manage.window.full_screen

sleep(5)

driver.quit