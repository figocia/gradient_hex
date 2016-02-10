require 'minitest/autorun'
require_relative 'gradient_generator'

class GradientTest < MiniTest::Unit::TestCase
  
  def test_gradient_1
    assert_equal ["FF334C", "FB4A46", "F66041", "F2773B", "EE8E36", "E9A430", "E5BB2B", "E1D225", "DCE820", "D8FF1A"], GradientGenerator.gradient("FF334C", "D8FF1A", 10)

  end

  def test_gradient_2
    assert_equal ["000000", "111111", "222222", "333333", "444444", "555555", "666666", "777777", "888888", "999999", "AAAAAA", "BBBBBB", "CCCCCC", "DDDDDD", "EEEEEE", "FFFFFF"], GradientGenerator.gradient("000000", "FFFFFF", 16)
  end

  def test_gradient_3
    assert_equal ["DCE820", "6E7410", "000000"], GradientGenerator.gradient("DCE820", "000000", 3)
  end


   def test_gradient_edge_case_1    
    assert_equal ["000000", "FFFFFF"], GradientGenerator.gradient("000000", "FFFFFF", 0)
  end

  def test_gradient_edge_case_2    
    assert_equal ["000000", "FFFFFF"], GradientGenerator.gradient("000000", "FFFFFF", 1)
  end

  def test_gradient_edge_case_3    
    assert_equal ["000000", "FFFFFF"], GradientGenerator.gradient("000000", "FFFFFF", 2)
  end

  def test_gradient_small_step    
    assert_equal ["000000", "FFFFFF"], GradientGenerator.gradient("000000", "FFFFFF", -1)
  end


  def test_gradient_big_step    
    assert_equal 64, GradientGenerator.gradient("000000", "FFFFFF", 100).size
  end
  
  def test_gradient_invalid_1    
    assert_equal "From and to color need to be 6 digit hex value", GradientGenerator.gradient("000", "FFFFFF", 16)
  end

  def test_gradient_invalid_2    
    assert_equal "From and to color need to be 6 digit hex value", GradientGenerator.gradient("000000", "FFFFF", 10)
  end

  def test_gradient_invalid_3
    assert_equal "Invalid hex string", GradientGenerator.gradient("000000", "FFFFGF", 10)
  end
  
  def test_gradient_invalid_4
    assert_equal "Invalid hex string", GradientGenerator.gradient("Z^%!#0", "FFFFFF", 10)
  end
end