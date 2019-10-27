class CustomSet
	
	def initialize(set =[])
		@set = set.uniq.sort
	end 

	def empty?
		set.empty?
	end

	def member?(element)
		set.include?(element)
	end

	def subset?(other)
		set.all? { |element| other.member? element}
	end

	def disjoint?(other)
		set.none? { |element| other.member? element}
	end
	
	def == (other)
		set == other.set
	end

	def add(element)
		tap do
			@set = (set + [element]).uniq.sort
		end
	end

	def intersection(other)
		self.class.new(set.select { |element| other.member? element })
	end

  def difference(other)
    self.class.new(set.reject { |element| other.member? element })
  end

  def union(other)
    self.class.new(set + other.set)
  end


	protected
	attr_reader :set
end