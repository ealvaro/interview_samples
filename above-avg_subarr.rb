def avg (low, high)
  total = 0
  if low <= high
    (low..high).map do |i|
      # puts "index=#{i}"
      total += A[i-1]
    end
      return total / (high - low + 1)
  end
  return 0
end

def aboveAverageSubArrays (arr)
  for i in 1...N
    for j in i...N
      if avg(i,j) > avg(i+1,N-1)
        @@output << [i,i]
      end
    end
  end
end

N = 10
max_v = 100
# A = Array.new(N) { Random.rand(1..max_v)}
A = [1,2,3,4,5,6,7,8,9,10]
@@output = []
aboveAverageSubArrays(A)
# puts avg 1,10
puts @@output.to_s