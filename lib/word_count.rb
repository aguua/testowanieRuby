class Phrase

	def initialize(phrase)
		@phrase = phrase
	end 
	def word_count
		hash = {}
		words = @phrase.downcase.scan(/\w+'\w|\w+/)  
		words.each { |word|
			hash["#{word}"] = words.count(word)
		}
		hash
	end 


end 
