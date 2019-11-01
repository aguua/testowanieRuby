# frozen_string_literal: true
require 'hello_world'

RSpec.describe HelloWorld do
  describe "#hello_world_test" do
    it "return 'Hello World'" do
        message = HelloWorld.hello
         expect(message).to eq "Hello, World!" 
    end

  end
end
