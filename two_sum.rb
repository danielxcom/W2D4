# O(n) as it is iterative, straight forward array loop.
# O(n^2) Quadratic, now we compare the two loops and find
# something that matches target sum.
# idx+1 to never check same pair. its slower because it has more
# loops = more steps.

def bad_two_sum(arr, target_sum)

  (0...arr.length).each do |idx|
    el = arr[idx]
    (idx+1...arr.length).each do |jdx|
      el2 = arr[jdx]
      puts "#{el} + #{el2}"
      return true if el + el2 == target_sum
    end
  end

  return false
end

#O(n log n) Sorting. FASTER.
# Why? Because we rearrange the values so that the highest iter
# Only when finding [1,2,3], 6.
# Haven't worked out how to do this with other nums.
def okay_two_sum?(arr, target_sum)

  arr.sort! do |el1, el2|
    el1 + el2
  end
  # return arr
  return arr[0] + arr[1] == target_sum
  # return false
end
