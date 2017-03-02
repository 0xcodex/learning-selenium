require 'watir'
require 'test/unit'
require 'page-object'

class BmiCalcPage
  include PageObject
  
  text_field(:height, :id => 'heightCMS')
  text_field(:weight, :id => 'weightKg')
  button(:calculate, :value => 'Calculate')
  text_field(:bmi, :id => 'bmi')
  text_field(:bmi_category, :id => 'bmi_category')
  
  def calculate_bmi(height, weight)
    self.height = height
    self.weight = weight
    calculate
  end

  def open()
        @browser.get 'http://cookbook.seleniumacademy.com/bmicalculator.html'
  end
end

class BmiCalcTest < Test::Unit::TestCase
  def test_bmi_calculation
    @driver = Selenium::WebDriver.for :chrome
    bmi_calc = BmiCalcPage.new(@driver)
    bmi_calc.open()
    bmi_calc.calculate_bmi('181','80')
    assert_equal '24.4', bmi_calc.bmi
    assert_equal 'Normal', bmi_calc.bmi_category
    @driver.close()
  end 
end