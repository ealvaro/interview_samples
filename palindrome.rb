# Palindrome is a word that is spelled the same forward or backwards
# foxof
# Lovvol
# noon
# radar
def palindrome(str)
  if str.reverse == str
    return true
  else
    return false
  end
end

puts palindrome('noon')
puts palindrome('radar')
puts palindrome('rader')
