require 'high_scores'

RSpec.describe HighScores do

	it 'get list of scores' do
	    scores = [30, 50, 20, 70]
		expected = [30, 50, 20, 70]
		expect(HighScores.new(scores).scores).to eq expected
	end

	it 'get latest score' do
		scores = [100, 0, 90, 20]
		expect(HighScores.new(scores).latest).to eq 20
	end 

	it 'get personal best' do
		scores = [100, 0, 90, 20]
		expect(HighScores.new(scores).personal_best).to eq 100
	end

	it 'get personal top three from a list of scores' do
		scores = [10, 30, 90, 30, 100, 20, 10, 0, 30, 40, 40, 70, 70]
		expected = [100, 90, 70]
		expect(HighScores.new(scores).personal_top_three).to eq expected
	end 

	it 'get personal top highest to lowest' do
		scores = [10, 30, 20]
		expected = [30, 20, 10]
		expect(HighScores.new(scores).personal_top_three).to eq expected
	end 

	it 'get personal top three when there is less than 3' do
		scores = [70, 20]
		expected = [70, 20]
		expect(HighScores.new(scores).personal_top_three).to eq expected
	end 

	it 'get personal top three when there is only one' do
		scores = [20]
		expected = [20]
		expect(HighScores.new(scores).personal_top_three).to eq expected
	end 

	it 'latest score is personal best' do
	    scores = [100, 40, 10, 700]
		expect(HighScores.new(scores).latest_is_personal_best?).to be true
	end

	it 'latest score is not  personal best' do
		scores = [100, 40, 10, 70]
		expect(HighScores.new(scores).latest_is_personal_best?).to be_falsey
	end


end
