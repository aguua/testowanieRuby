require  'raindrops'
RSpec.describe Raindrops do
  it("the sound for 1 is 1") { expect(Raindrops.convert(1)).to(eq("1")) }
  it("the sound for 3 is pling") do
    expect(Raindrops.convert(3)).to(eq("Pling"))
  end
  it("the sound for 5 is plang") do
    expect(Raindrops.convert(5)).to(eq("Plang"))
  end
  it("the sound for 7 is plong") do
    expect(Raindrops.convert(7)).to(eq("Plong"))
  end
  it("the sound for 6 is pling as it has a factor 3") do
    expect(Raindrops.convert(6)).to(eq("Pling"))
  end
  it("2 to the power 3 does not make a raindrop sound as 3 is the exponent not the base") do
    expect(Raindrops.convert(8)).to(eq("8"))
  end
  it("the sound for 9 is pling as it has a factor 3") do
    expect(Raindrops.convert(9)).to(eq("Pling"))
  end
  it("the sound for 10 is plang as it has a factor 5") do
    expect(Raindrops.convert(10)).to(eq("Plang"))
  end
  it("the sound for 14 is plong as it has a factor of 7") do
    expect(Raindrops.convert(14)).to(eq("Plong"))
  end
  it("the sound for 15 is plingplang as it has factors 3 and 5") do
    expect(Raindrops.convert(15)).to(eq("PlingPlang"))
  end
  it("the sound for 21 is plingplong as it has factors 3 and 7") do
    expect(Raindrops.convert(21)).to(eq("PlingPlong"))
  end
  it("the sound for 25 is plang as it has a factor 5") do
    expect(Raindrops.convert(25)).to(eq("Plang"))
  end
  it("the sound for 27 is pling as it has a factor 3") do
    expect(Raindrops.convert(27)).to(eq("Pling"))
  end
  it("the sound for 35 is plangplong as it has factors 5 and 7") do
    expect(Raindrops.convert(35)).to(eq("PlangPlong"))
  end
  it("the sound for 49 is plong as it has a factor 7") do
    expect(Raindrops.convert(49)).to(eq("Plong"))
  end
  it("the sound for 52 is 52") { expect(Raindrops.convert(52)).to(eq("52")) }
  it("the sound for 105 is plingplangplong as it has factors 3 5 and 7") do
    expect(Raindrops.convert(105)).to(eq("PlingPlangPlong"))
  end
  it("the sound for 3125 is plang as it has a factor 5") do
    expect(Raindrops.convert(3125)).to(eq("Plang"))
  end
end
