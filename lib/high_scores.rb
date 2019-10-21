class HighScores

	def initialize(scores)
		@scores = scores
	end
	
	def scores
		@scores
	end

	def latest
		@scores[-1]
	end

	def personal_best
		@scores.max
	end

	def personal_top_three
		@scores.sort.reverse[0..2]
		# or simply:
		# @scores.max(3) 
	end

	def latest_is_personal_best?
		if self.latest == self.personal_best 
			return true
		end
		# or simply could return result of:
		# @score.max == @score.last
	end
end 