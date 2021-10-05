# Rotational Cipher
# One simple way to encrypt a string is to "rotate" every alphanumeric character by a certain amount. Rotating a character means replacing it with another character that is a certain number of steps away in normal alphabetic or numerical order.
# For example, if the string "Zebra-493?" is rotated 3 places, the resulting string is "Cheud-726?". Every alphabetic character is replaced with the character 3 letters higher (wrapping around from Z to A), and every numeric character replaced with the character 3 digits higher (wrapping around from 9 to 0). Note that the non-alphanumeric characters remain unchanged.
# Given a string and a rotation factor, return an encrypted string.
# Signature
# string rotationalCipher(string input, int rotationFactor)
# Input
# 1 <= |input| <= 1,000,000
# 0 <= rotationFactor <= 1,000,000
# Output
# Return the result of rotating input a number of times equal to rotationFactor.
# Example 1
# input = Zebra-493?
# rotationFactor = 3
# output = Cheud-726?
# Example 2
# input = abcdefghijklmNOPQRSTUVWXYZ0123456789
# rotationFactor = 39
# output = nopqrstuvwxyzABCDEFGHIJKLM9012345678
# We don’t provide test cases in this language yet, but have outlined the signature for you. Please write your code below, and don’t forget to test edge cases!
def rotational_cipher(input, rotation_factor)
  rf = rotation_factor % 26
  rf_n = rotation_factor % 10
  i = 0
  input.each_byte do |c|
    asc = c.ord
    case asc
      when 'A'.ord..'Z'.ord
        new = c.ord + rf
        if new > 'Z'.ord
          new = 'A'.ord + (new - 'Z'.ord) - 1
        end
      when 'a'.ord..'z'.ord
        new = c.ord + rf
        if new > 'z'.ord
          new = 'a'.ord + (new - 'z'.ord) - 1
        end
      when '0'.ord..'9'.ord
        new = c.ord + rf_n
        if new > '9'.ord
          new = '0'.ord + (new - '9'.ord) - 1
        end
    else
      new = asc
    end
    input[i] = new.chr
    i += 1
  end
  input
end

N = 1000
puts "#{'A'.ord},#{'Z'.ord},#{'a'.ord},#{'z'.ord},#{'0'.ord},#{'9'.ord}"
puts "**************"
#input = "^&%$%*()"
#input = (0...N).map { ('0'..'z').to_a[rand(74)]}.join
#puts input
input = "abcdefghijklmNOPQRSTUVWXYZ0123456789"
#input = "Zebra-493?"
r_f = 0
puts "**************"
puts rotational_cipher(input, r_f)

# Call rotational_cipher() with test cases here