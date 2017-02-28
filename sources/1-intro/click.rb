require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome
driver.navigate.to "http://vuejs.org/v2/guide/"

element = driver.find_element(css: '#app-5 > button')
#target = driver.find_element(id: 'div2')

#puts element.inspect
#p target

driver.action.click(element).perform

#driver.action.click(element).perform
#driver.action.drag_and_drop(element, target).perform

sleep(10)