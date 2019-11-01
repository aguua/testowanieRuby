class Raindrops
  def self.convert(num)
    div_of_num = (1..num).select { |n| num % n == 0 }
     
    ret_str = ''

    ret_str += 'Pling' if div_of_num.include? 3
    ret_str += 'Plang' if div_of_num.include? 5
    ret_str += 'Plong' if div_of_num.include? 7 
    
    ret_str += num.to_s if ret_str.empty?

    ret_str
  end
end