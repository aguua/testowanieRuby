require 'grains'

RSpec.describe Grains do

	describe "#check grains for square between 1 and 64" do
		it "1 square" do
			 grains = Grains.square(1)
			 expect(grains).to eq 1
		end
		it "2 square" do
			 grains = Grains.square(2)
			 expect(grains).to eq 2
		end
		it "3 square" do
			 grains = Grains.square(3)
			 expect(grains).to eq 4
		end
		it "4 square" do
			 grains = Grains.square(4)
			 expect(grains).to eq 8
		end

	end 

	describe "#squares raise an ArgumentError" do
		it "0 square" do

			 expect{Grains.square(0)}.to raise_error ArgumentError
		end
		it "negative square" do
			 expect{ Grains.square(-4)}.to raise_error ArgumentError
		end
		it "greater than 64 square" do

			 expect{Grains.square(65)}.to raise_error ArgumentError
		end
	end

	it "get total number of grains on the board" do
		expect(Grains.total).to eq 18_446_744_073_709_551_615
	end

end