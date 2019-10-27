class TwelveDays

	def self.song
	song = ''
		12.times do |n| 
			song << "On the #{day(n)} day of Christmas my true love gave to me: #{present(n)}\n\n"
		end
	song
	end

	def self.day(n)
		days = ['first', 'second', 'third', 'fourth', 'fifth', 'sixth', 'seventh',
		'eighth', 'ninth', 'tenth', 'eleventh', 'twelfth']
		days[n]
	end 

	def self.present(n)
		my_present = ''
		presents = ['a Partridge in a Pear Tree.',
		'two Turtle Doves, and ',
		'three French Hens, ',
		'four Calling Birds, ',
		'five Gold Rings, ' ,
		'six Geese-a-Laying, ', 
		'seven Swans-a-Swimming, ',
		'eight Maids-a-Milking, ',
		'nine Ladies Dancing, ',
		'ten Lords-a-Leaping, ',
		'eleven Pipers Piping, ' ,
		'twelve Drummers Drumming, ']

		(n+1).times { |n|
			my_present.prepend presents[n]
		}

		my_present
	end 

end