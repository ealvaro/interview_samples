def gcm(frac)
  gcm = 1
  for i in 1..frac.min
    if frac[0]%i == 0 and frac[1]%i == 0
       gcm = i
    end
  end
  return gcm
end

def convertFracts(lst)
  # discover Denominator
  denom = 0
  lst.each do |frac|
    if 0 == denom
      denom = frac[1]
    else
      denom *= frac[1] / gcm([denom, frac[1]])
    end
    # puts denom
  end

  # modify the original array
  lst.each do |frac|
    frac[0] *= denom / frac[1]
    frac[1] = denom
  end
end
fractions = [[1, 2], [1, 3], [1, 4]]
# print the original array
puts fractions.inspect
convertFracts(fractions)
# print the modified array
puts fractions.inspect
# Test.assert_equals(convertFracts(fractions), [[6, 12], [4, 12], [3, 12]])
