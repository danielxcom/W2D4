# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
#    my_min(list)  # =>  -5

#Ω(n log(n))
# base algorithm

def my_min(list)
  list.sort[0]
end

# merge-sort algorithm

class Array
  def merge_min_sort(&prc) # Procifies the block
    return self if self.count <= 1

    prc ||= Proc.new {|el1, el2| el1 <=> el2}

    middle = self.length / 2
    left = self[0...middle]
    right = self[middle..-1]

    sorted_left = left.merge_sort(&prc)
    sorted_right = right.merge_sort(&prc)
    final = Array.merge(sorted_left, sorted_right, prc)
    final[0]
  end

  private
  def self.merge(left, right, prc)
    result = []
    until left.empty? || right.empty?
      if prc.call(left[0], right[0]) <= 0
        result += [left.shift]
      else
        result += [right.shift]
      end
    end

    result + left + right
  end
end

# O(n^2)

def min_quad(list)
  (0...list.length).each do |idx|
    item = list[idx]
    sort = true
    (0...list.length).each do |idx2|
      next if idx == idx2
      item2 = list[idx2]
      if item2 < item
        sort = false
      end
    end
    if sort
      return item
    end
  end
end

# O(1) constant space
def min_linear(list)
  smallest = list[0]

  list.each do |item|
    if smallest > item
      smallest = item
    end
  end

  smallest
end

# II Largest contiguous sub-sum
# list = [5, 3, -7]
#     largest_contiguous_subsum(list) # => 8
#
#     # possible sub-sums
#     [5]           # => 5
#     [5, 3]        # => 8 --> we want this one
#     [5, 3, -7]    # => 1
#     [3]           # => 3
#     [3, -7]       # => -4
#     [-7]          # => -7

# O(n^2)
def sub_sum(set)
  store = []

  (0...set.length).each do |idx|
    (0...set.length).each do |jdx|
      store << set[idx..jdx]
    end
  end
  amount = 0
  highest = 0

  store.each do |el|

    el.each do |sum|
      amount += sum
    end

    highest = amount if highest < amount
    amount = 0
  end

  highest
end

# list = [5,3,-7]
# sub_sum(list)
