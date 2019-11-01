require("luhn")
RSpec.describe Luhn do

  it("single digit strings can not be valid") do
    expect(Luhn.valid?("1")).to(eq(false))
  end

  it("a single zero is invalid") { expect(Luhn.valid?("0")).to(eq(false)) }

  it("a simple valid sin that remains valid if reversed") do
    expect(Luhn.valid?("059")).to(eq(true))
  end

  it("a simple valid sin that becomes invalid if reversed") do
    expect(Luhn.valid?("59")).to(eq(true))
  end

  it("a valid canadian sin") do
    expect(Luhn.valid?("055 444 285")).to(eq(true))
  end

  it("invalid canadian sin") do
    expect(Luhn.valid?("055 444 286")).to(eq(false))
  end

  it("invalid credit card") do
    expect(Luhn.valid?("8273 1232 7352 0569")).to(eq(false))
  end

  it("valid number with an even number of digits") do
    expect(Luhn.valid?("095 245 88")).to(eq(true))
  end

  it("valid strings with a non digit included become invalid") do
    expect(Luhn.valid?("055a 444 285")).to(eq(false))
  end

  it("valid strings with a non digit added at the end become invalid") do
    expect(Luhn.valid?("059a")).to(eq(false))
  end

  it("valid strings with punctuation included become invalid") do
    expect(Luhn.valid?("055-444-285")).to(eq(false))
  end

  it("valid strings with symbols included become invalid") do
    expect(Luhn.valid?("055\u00A3 444$ 285")).to(eq(false))
  end

  it("single zero with space is invalid") do
    expect(Luhn.valid?(" 0")).to(eq(false))
  end

  it("more than a single zero is valid") do
    expect(Luhn.valid?("0000 0")).to(eq(true))
  end

  it("input digit 9 is correctly converted to output digit 9") do
    expect(Luhn.valid?("091")).to(eq(true))
  end

  it("strings with non digits is invalid") do
    expect(Luhn.valid?(":9")).to(eq(false))
  end
end
