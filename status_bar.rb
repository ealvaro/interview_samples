ON = 1
OFF = 0
# [[5, ON], [7, OFF], [30, ON], [31, OFF], [36, ON]]

# 0         5   7                                             30 31        36
# + + + + + + - - + + + + + + + + + + + + + + + + + + + + + + +  - + + + + +

# input:  [[5, ON], [7, OFF], [30, ON], [31, OFF], [36, ON]]
# output:  [[5,7], [30,31]]

def off_times(tuples)
  output_list = []
  current_pair = []
  tuples.each do |t|
    if t[1] == ON
      unless current_pair.empty?
      output_list << current_pair
      end
      current_pair = [t[0]]
    else
      unless current_pair.empty?
        current_pair << t[0]
      else
        output_list << [0, t[0]]
      end
    end
  end
  output_list
end

tuples = [[5, ON], [7, OFF], [30, ON], [31, OFF], [36, ON]]
puts off_times(tuples).inspect