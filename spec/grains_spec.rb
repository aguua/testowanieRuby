require 'grains'

RSpec.describe Grains do


		it "grains for 1 square" do
			 grains = Grains.square(1)
			 expect(grains).to eq 1
		end
		it "grains for 2 square" do
			 grains = Grains.square(2)
			 expect(grains).to eq 2
		end
		it "grains for 3 square" do
			 grains = Grains.square(3)
			 expect(grains).to eq 4
		end
		it "grains for 4 square" do
			 grains = Grains.square(4)
			 expect(grains).to eq 8
		end


		it "0 square raise an ArgumentError" do

			 expect{Grains.square(0)}.to raise_error ArgumentError
		end
		it "negative square raise an ArgumentError" do
			 expect{ Grains.square(-4)}.to raise_error ArgumentError
		end
		it "greater than 64 square raise an ArgumentError" do

			 expect{Grains.square(65)}.to raise_error ArgumentError
		end


	it "get total number of grains on the board" do
		expect(Grains.total).to eq 18_446_744_073_709_551_615
	end

end