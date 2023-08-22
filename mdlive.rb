def prime?(num)
  if num > 3
    (2..num/2).map do |i|
      if num % i == 0
        puts "#{num} is divisible by #{i}"
        return false
      end
    end
  end
  puts "#{num} is prime!"
  return true && num > 0
end

1000.times do |p|
  puts prime? p
end

