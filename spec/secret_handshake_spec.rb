require 'secret_handshake'

RSpec.describe SecretHandshake do
	let(:shake1) { SecretHandshake.new 1}
	let(:shake2) { SecretHandshake.new 2}
	let(:shake3) { SecretHandshake.new 3}
	let(:shake4) { SecretHandshake.new 4}
	let(:shake8) { SecretHandshake.new 8}
	let(:shake19) { SecretHandshake.new 19}
	let(:shake31) { SecretHandshake.new 31}
	let(:shake_string) { SecretHandshake.new 'piggies'}

		it "1 to wink" do
			 expect(shake1.commands).to eq ['wink']
		end
		it "10 to double blink" do
			 expect(shake2.commands).to eq ['double blink']
		end
		it "100 to close your eyes" do
			 expect(shake4.commands).to eq ['close your eyes']
		end
		it "1000 to jump" do
			 expect(shake8.commands).to eq ['jump']
		end
	
		it "11 to wink and double blink" do
			 expect(shake3.commands).to eq ['wink', 'double blink']
		end
		it "10011 to double blink and wink" do
			 expect(shake19.commands).to eq ['double blink', 'wink']
		end
		it "11111 to all events" do
			expect(shake31.commands).to eq ['jump', 'close your eyes', 'double blink', 'wink']
		end
	
		it "invalid handshake returns empty list" do
			expect(shake_string.commands).to eq []
		end 
	


end