require 'twelve_days'

RSpec.describe  TwelveDays do
  it("get the whole song") do
    song_file = File.expand_path("../song.txt", ".\\test\\twelve_days_test.rb")
    expected = IO.read(song_file)
    expect(TwelveDays.song).to(eq(expected))
  end
end
