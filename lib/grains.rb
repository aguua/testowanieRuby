class Grains

	def self.square(n)
		if n < 1 || n > 64
		  raise(ArgumentError)
		end
		2 ** (n-1)
	end   

	def self.total
		sum = 0
		64.times do |i|
			sum += square(i+1)
		end
		sum
	end

end    

