require 'twelve_days'

RSpec.describe  TwelveDays do
  it("get the whole song") do
    song_file = ".\\test\\song.txt"
    expected = IO.read(song_file)
    expect(TwelveDays.song).to(eq(expected))
  end
end
