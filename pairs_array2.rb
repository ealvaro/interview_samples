# We don’t provide test cases in this language yet, but have outlined the signature for you. Please write your code below, and don’t forget to test edge cases!
=begin
 Pair Sums
Given a list of n integers arr[0..(n-1)], determine the number of different pairs of elements within it which sum to k.
If an integer appears in the list multiple times, each copy is considered to be different; that is, two pairs are considered different if one pair includes at least one array index which the other doesn't, even if they include the same values.
Signature
int numberOfWays(int[] arr, int k)
Input
n is in the range [1, 100,000].
Each value arr[i] is in the range [1, 1,000,000,000].
k is in the range [1, 1,000,000,000].
Output
Return the number of different pairs of elements which sum to k.
Example 1
n = 5
k = 6
arr = [1, 2, 3, 4, 3]
output = 2
The valid pairs are 2+4 and 3+3.
Example 2
n = 5
k = 6
arr = [1, 5, 3, 3, 3]
output = 4
There's one valid pair 1+5, and three different valid pairs 3+3 (the 3rd and 4th elements, 3rd and 5th elements, and 4th and 5th elements).
=end

def number_of_ways(arr, k)
  freq_map = Hash.new(0)
  count = 0

  # Count the frequencies of each element in the list
  arr.each { |num| freq_map[num] += 1 }

  # Calculate the number of pairs
  arr.each do |num|
    complement = k - num
    count += freq_map[complement] if freq_map.key?(complement)

    # Exclude the case where num + num = k to avoid counting duplicates
    count -= 1 if complement == num
  end

  # Divide by 2 since each pair is counted twice (once for each element)
  count / 2
end

arr = [1, 11, 6, 3, 5, 19, 8, 7, 2, 5, 4, 10, 9, 1, 20, 19, 17, 3, 21, 7]
k = 10
ways = number_of_ways(arr, k)
puts "Number of ways: #{ways}"
