
require 'acronym'

RSpec.describe Acronym do

    it "upcase words" do
         a = Acronym.abbreviate('Portable Network Graphics')
         expect(a).to eq "PNG" 
    end

	it "lowercase words" do
		a = Acronym.abbreviate('Ruby on Rails')
		expect(a).to eq "ROR"
    end

	it "caps word" do
		a = Acronym.abbreviate('GNU Image Manipulation Program')
		expect(a).to eq "GIMP"
    end

	it "punctuation" do
		a = Acronym.abbreviate('First In, First Out')
		expect(a).to eq "FIFO"
	end

	it "punctuation without whitespace" do
		a = Acronym.abbreviate('Complementary metal-oxide semiconductor')
		expect(a).to eq "CMOS"
	end

	it "delimiters" do
		a = Acronym.abbreviate('Something - I made up from thin air')
		expect(a).to eq "SIMUFTA"
	end

	it "long abbreviation" do
		a = Acronym.abbreviate('Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me')
		expect(a).to eq "ROTFLSHTMDCOALM"
	end


end
