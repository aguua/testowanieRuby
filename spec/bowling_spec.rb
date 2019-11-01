require 'bowling'

RSpec.describe Game do

 		 game1 = Game.new
		 rolls = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
		 rolls.each { |pins| game1.roll(pins) }
		 it 'with all zeros' do
			expect(game1.score).to eq 0
		 end

		 game2 = Game.new
		 rolls = [3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6]
		 rolls.each { |pins| game2.roll(pins) }
		 it 'with no strikes nor spares' do
			expect(game2.score).to eq 90
		 end

		 game3 = Game.new
		 rolls = [6, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
		 rolls.each { |pins| game3.roll(pins) }
		 it 'a spare followed by zeros is worth 10 points' do
			expect(game3.score).to eq 10
		 end

		 game4 = Game.new
		 rolls = [6, 4, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
		 rolls.each { |pins| game4.roll(pins) }
		 it 'points after a space are counted twice' do
			expect(game4.score).to eq 16
		 end
		 
		 game5 = Game.new
		 rolls = [5, 5, 3, 7, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
		 rolls.each { |pins| game5.roll(pins) }
		 it 'consecutive spares each get a one roll bonus' do
			expect(game5.score).to eq 31
		 end

		 game6 = Game.new
		 rolls = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 3, 7]
		 rolls.each { |pins| game6.roll(pins) }
		 it 'a spare in last frame gets a one roll bonus that is counted once' do
			expect(game6.score).to eq 17
		 end

		 game7 = Game.new
		 rolls = [10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
		 rolls.each { |pins| game7.roll(pins) }
		 it 'a single strike earns 10 points' do
			expect(game7.score).to eq 10
		 end

		 game8 = Game.new
		 rolls = [10, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
		 rolls.each { |pins| game8.roll(pins) }
		 it 'points scored in frame after a stike are counted twice' do
			expect(game8.score).to eq 26
		 end

		 game9 = Game.new
		 rolls = [10, 10, 10, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
		 rolls.each { |pins| game9.roll(pins) }
		 it 'consecutive stikes each get two roll bonus' do
			expect(game9.score).to eq 81
		 end

		 game10 = Game.new
		 rolls = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 7, 1]
		 rolls.each { |pins| game10.roll(pins) }
		 it 'a strike in the last frame gets a two roll bonus that is counted once' do
			expect(game10.score).to eq 18
		 end

		 game11 = Game.new
		 rolls = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 7, 3]
		 rolls.each { |pins| game11.roll(pins) }
		 it 'rolling a spare with the two roll bonus does not get a bonus roll' do
			expect(game11.score).to eq 20
		 end

		 game12 = Game.new
		 rolls = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 10]
		 rolls.each { |pins| game12.roll(pins) }
		 it 'strikes with the two roll bonus do not get  bonus rolls' do
			expect(game12.score).to eq 30
		 end

		 game13 = Game.new
		 rolls = [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]
		 rolls.each { |pins| game13.roll(pins) }
		 it 'all strikes is a perfect game' do
			expect(game13.score).to eq 300
		 end



		 err_game1 = Game.new
		 rolls = []
		 rolls.each { |pins| err_game1.roll(pins) }
		 it 'rolls cannot score negative points' do
			 expect{err_game1.roll(-1)}.to raise_error Game::BowlingError
		 end

		 err_game2 = Game.new
		 rolls = [5]
		 rolls.each { |pins| err_game2.roll(pins) }
		 it 'rolls in a frame cannot score more than 10 points' do
			 expect{err_game2.roll(6)}.to raise_error Game::BowlingError
		 end

		 
		 err_game3 = Game.new
		 rolls = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10]
		 rolls.each { |pins| err_game3.roll(pins) }
		 it 'bonus roll after a strike in the last frame cannot score more than 10 points' do
			 expect{err_game3.roll(11)}.to raise_error Game::BowlingError
		 end

		 err_game4 = Game.new
		 rolls = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 5]
		 rolls.each { |pins| err_game4.roll(pins) }
		 it 'two bonus roll after a strike in the last frame cannot score more than 10 points' do
			 expect{err_game4.roll(6)}.to raise_error Game::BowlingError
		 end

		 err_game5 = Game.new
		 rolls =  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 6]
		 rolls.each { |pins| err_game5.roll(pins) }
		 it 'the second bonus after a strike cannot be a strike the first is not a strike' do
			 expect{err_game5.roll(10)}.to raise_error Game::BowlingError
		 end

		 err_game6 = Game.new
		 rolls =  []
		 rolls.each { |pins| err_game6.roll(pins) }
		 it 'an unstarted game cannot be scored' do
			 expect{err_game6.score}.to raise_error Game::BowlingError
		 end

		 err_game7 = Game.new
		 rolls =  [0, 0 , 2]
		 rolls.each { |pins| err_game7.roll(pins) }
		 it 'an incomplete game cannot be scored' do
			 expect{err_game7.score}.to raise_error Game::BowlingError
		 end

		 err_game8 = Game.new
		 rolls =  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
		 rolls.each { |pins| err_game8.roll(pins) }
		 it 'cannot roll if game already has 10 frames' do
			 expect{err_game8.roll(1)}.to raise_error Game::BowlingError
		 end

		 err_game9 = Game.new
		 rolls =  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10]
		 rolls.each { |pins| err_game9.roll(pins) }
		 it 'bonus after the last strike must be rolled before scored can be calculated' do
			 expect{err_game9.score}.to raise_error Game::BowlingError
		 end

		 err_game10 = Game.new
		 rolls =  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10]
		 rolls.each { |pins| err_game10.roll(pins) }
		 it 'both bonus after the last strike must be rolled before scored can be calculated' do
			 expect{err_game10.score}.to raise_error Game::BowlingError
		 end

		 err_game11 = Game.new
		 rolls =  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 3]
		 rolls.each { |pins| err_game11.roll(pins) }
		 it 'bonus roll for a spare in the last frame must be rolled before scored can be calculated' do
			 expect{err_game11.score}.to raise_error Game::BowlingError
		 end

		 err_game12 = Game.new
		 rolls =  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 3, 2]
		 rolls.each { |pins| err_game12.roll(pins) }
		 it 'cannot roll after bonus roll for spare ' do
			 expect{err_game12.roll(3)}.to raise_error Game::BowlingError
		 end

		 err_game13 = Game.new
		 rolls =  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 3, 2]
		 rolls.each { |pins| err_game13.roll(pins) }
		 it 'cannot roll afteer bonus roll for strike' do
			 expect{err_game13.roll(3)}.to raise_error Game::BowlingError
		 end


end
