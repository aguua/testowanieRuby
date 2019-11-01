require 'resistor_color_duo'

RSpec.describe ResistorColorDuo do

    it "check for brown and black" do
         num = ResistorColorDuo.value(["brown", "black"])
         expect(num).to eq 10
    end

    it "check for blue and grey" do
         num = ResistorColorDuo.value(["blue", "grey"])
         expect(num).to eq 68
    end

    it "check for yellow and violet" do
         num = ResistorColorDuo.value(["yellow", "violet"])
         expect(num).to eq 47
    end

    it "check for orange and orange" do
         num = ResistorColorDuo.value(["orange", "orange"])
         expect(num).to eq 33
    end

		it "ignore third color check for green,brown and orange" do
			num = ResistorColorDuo.value(["green", "brown", "orange"])
			expect(num).to eq 51
		end
end