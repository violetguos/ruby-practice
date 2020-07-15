require "test/unit"

def fibs(n)
    f_n = 0
    f_0 = 0
    f_1 = 1
    for i in 0..n do
        if i == 0
            f_n = f_0
        elsif i == 1
            f_n_min_1 = f_1
            f_n = f_1 
            f_n_min_2 = f_0
        else
            f_n = f_n_min_2 + f_n_min_1
            f_n_min_2 = f_n_min_1
            f_n_min_1 = f_n
        end
    end
    return f_n
end

# test cases
class TestSimpleNumber < Test::Unit::TestCase
 
  def test_simple
    assert_equal(0, fibs(0))
    assert_equal(1, fibs(1))
    assert_equal(1, fibs(2))
    assert_equal(5, fibs(5))
    assert_equal(21, fibs(8))
  end
 
end
