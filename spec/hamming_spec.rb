require 'hamming'

RSpec.describe Hamming do
	it 'empty strands' do
		expect(Hamming.compute('','')).to eq 0
	end
	it 'single letter identical strands' do
		expect(Hamming.compute('A','A')).to eq 0
	end
	it 'single letter diffrent strands' do
		expect(Hamming.compute('F','A')).to eq 1
	end
	it 'long identical strands' do
		expect(Hamming.compute('GGACTGAAATCTG', 'GGACTGAAATCTG')).to eq 0
	end
	it 'long diffrent strands' do
		expect(Hamming.compute('GGACGGATTCTG', 'AGGACGGATTCT')).to eq 9
	end
	it 'disallow first strand longer' do
		expect{Hamming.compute('GGTG', 'AAA')}.to raise_error ArgumentError
	end
	it 'disallow second strand longer' do
		expect{Hamming.compute('AAA', 'GGTG')}.to raise_error ArgumentError
	end
end 