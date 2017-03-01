require 'selenium-webdriver'

driver = Selenium::WebDriver.for :remote, url: 'http://localhost:4444/wd/hub', desired_capabilities: :chrome

driver.get "http://mps.hailiangtong.com"

driver.manage.window.move_to(10,10)

sleep(2)

driver.manage.window.maximize

sleep(5)

driver.quit