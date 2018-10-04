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
