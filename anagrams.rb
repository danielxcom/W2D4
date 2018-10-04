# anagram?("gizmo", "sally")    #=> false

# O(n^3) Cubic time space complexity
# Reason: Nested for loop with additional 2 loops to settle the strings
# into hash map.
def anagram?(str1, str2)
  hash1 = Hash.new
  hash2 = Hash.new
  if str1.length != str2.length
    return false
  end

  str1.each_char do |el|
    if hash1[el].nil?
      hash1[el] = 1
    else
      hash1[el] += 1
    end
  end

  str2.each_char do |el|
    if hash2[el].nil?
      hash2[el] = 1
    else
      hash2[el] += 1
    end
  end

  hash1.each do |key, item|
    hash2.each do |key, item|
      return false if hash1[key] != hash2[key]
    end
  end

  return true
end

# anagram?("elvis", "lives")    #=> true

#O(n!)
# Reason: The n length is longest input word.
# Worst case is literally if all strings have same length.
# str.length == n gives you your sub-set loops. Your complexity.
def first_anagram?(str1, str2)
  split = str1.split('')
  split2 = str2.split('')
  subs = permutations(split)
  if subs.include?(split2)
    return true
  else
    return false
  end
end

def permutations(string)
  return [string] if string.length < 2
  result = []
  first = string.shift
  perms = permutations(string)

  perms.each do |sub_s|
    (0...sub_s.length).each do |i|
      result << sub_s[0...i] + [first] + sub_s[i..-1]
    end
  end

  result
end
