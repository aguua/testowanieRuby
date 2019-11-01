require 'proverb'

RSpec.describe Proverb do

  it("a single consequence") do
    proverb = Proverb.new("nail", "shoe")
    expected = "For want of a nail the shoe was lost.\nAnd all for the want of a nail."
    expect(proverb.to_s).to(eq(expected))
  end
  it("a short chain of consequences") do
    proverb = Proverb.new("nail", "shoe", "horse")
    expected = "For want of a nail the shoe was lost.\nFor want of a shoe the horse was lost.\nAnd all for the want of a nail."
    expect(proverb.to_s).to(eq(expected))
  end
  it("a longer chain of consequences") do
    proverb = Proverb.new("nail", "shoe", "horse", "rider")
    expected = "For want of a nail the shoe was lost.\nFor want of a shoe the horse was lost.\nFor want of a horse the rider was lost.\nAnd all for the want of a nail."
    expect(proverb.to_s).to(eq(expected))
  end
  it("proverb does not hard code the rhyme dictionary") do
    proverb = Proverb.new("key", "value")
    expected = "For want of a key the value was lost.\nAnd all for the want of a key."
    expect(proverb.to_s).to(eq(expected))
  end
  it("the whole proverb") do
    chain = ["nail", "shoe", "horse", "rider", "message", "battle", "kingdom"]
    proverb = Proverb.new(*chain)
    expected = "For want of a nail the shoe was lost.\nFor want of a shoe the horse was lost.\nFor want of a horse the rider was lost.\nFor want of a rider the message was lost.\nFor want of a message the battle was lost.\nFor want of a battle the kingdom was lost.\nAnd all for the want of a nail."
    expect(proverb.to_s).to(eq(expected))
  end
  it("an optional qualifier in the final consequence") do
    chain = ["nail", "shoe", "horse", "rider", "message", "battle", "kingdom"]
    proverb = Proverb.new(*chain, :qualifier => "horseshoe")
    expected = "For want of a nail the shoe was lost.\nFor want of a shoe the horse was lost.\nFor want of a horse the rider was lost.\nFor want of a rider the message was lost.\nFor want of a message the battle was lost.\nFor want of a battle the kingdom was lost.\nAnd all for the want of a horseshoe nail."
    expect(proverb.to_s).to(eq(expected))
  end
  it("proverb is same each time") do
    proverb = Proverb.new("nail", "shoe")
    expect(proverb.to_s).to(eq(proverb.to_s))
  end

end
