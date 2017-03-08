#require 'selenium-webdriver'
require 'test/unit'
require 'mini_magick'
require 'pp'

def comparing(image1_path, image2_path)

end

class ComparingImageDemo < Test::Unit::TestCase
  def setup
  	
  end

  def test_image
    
    compare = MiniMagick::Tool::Compare.new(whiny: false)

    compare.metric('AE')
    compare << '1.png'
    compare << '2.png'
    compare << 'diff.png'

    compare.call do |_, dist, _|
      assert_false dist.to_i.zero?
    end

    compare1 = MiniMagick::Tool::Compare.new(whiny: false)
    compare1.metric('AE')
    compare1 << '1.png'
    compare1 << '3.png'
    compare1 << 'diff2.png'

    compare1.call do |_, dist, _|
      assert_true dist.to_i.zero?
    end   

  end

  def teardown
  	
  end
end