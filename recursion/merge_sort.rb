require "test/unit"

def merge_sort(arr)
    
    if arr.length <= 1
        return arr
    end

    left = arr.slice(0, arr.length/2)
    right = arr.slice(arr.length/2, arr.length)
    left = merge_sort(left)
    right = merge_sort(right)
    return merge(left, right)
end

def merge(left, right)
    result = []
    while !left.empty? && !right.empty?
        if left[0] < right[0]
            result.append(left[0])
            left = left.slice(1, left.length)
        elsif left[0] >= right[0]
            result.append(right[0])
            right = right.slice(1, right.length)
        end
    end

    # leftovers
    if !left.empty?
        result = result.concat left
    elsif !right.empty?
        result = result.concat right
    end
    return result
end

# test cases
class TestSimpleNumber < Test::Unit::TestCase
 
    def test_simple
      assert_equal([1, 2, 3], merge_sort([3, 1, 2]))
    end   
end
