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
  ways = 0
  for i in 0...N
    if arr[i] <= k
      for j in i+1...N
        if arr[i] + arr[j] > k
          break
        elsif  arr[i] + arr[j] == k then
          ways += 1
        end
      end
    end
  end
  ways
end

N = 20      #must be greater than 1
max_v = 1000   #must be greater than 1
k = 10        #must be <= 2 * max_v
#array = Array.new(N) { Random.rand(1...max_v + 1)}
array = [ 0,11,6,3,5,19,8,7,2,5,4,10,9,1,20,19,17,3,21,7 ]
#puts array
# puts array.tally
puts number_of_ways(array.sort,k)
# Call number_of_ways() with test cases here
