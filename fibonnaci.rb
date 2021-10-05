# f0 = 0
# f1 = 1
# f2 = 1
# f3 = 2
def fibonnaci(num)
  return nil if num < 0
  if num == 0 then
    return 0
  elsif num == 1 then
    return 1
  else
    return fibonnaci(num-1) + fibonnaci(num-2)
  end
end

puts fibonnaci(0)
puts fibonnaci(1)
puts fibonnaci(2)
puts fibonnaci(3)
puts fibonnaci(4)
