class Series
	def initialize(series)
		@series = series
		@digits = series.chars
	end
	def slices(n)
		raise ArgumentError if n > @series.size
		@digits.each_cons(n).map(&:join)
	end
end