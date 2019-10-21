class Luhn
    def self.valid? string
      s = string.delete(' ')
      return false if s.length <= 1 or /\D/.match? s
  
      s.chars.reverse.map.with_index {|x,i| (i+1) % 2 == 0 ? (x.to_i*2)>9?(x.to_i*2)-9:(x.to_i*2) : x.to_i }.sum % 10 == 0
    end
  end