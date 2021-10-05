require 'byebug'
class Hashy < Hash

	# def initialize (hash_param)
	#  @hashy = Hash.new (hash_param)	
	# end

    
	def fetch (key, *optional)
		if self.has_key? key
		# byebug
			self[key]
		else
			unless optional.empty?
				optional[0]
			else
  			    raise KeyError
  			end
		end
	end
end