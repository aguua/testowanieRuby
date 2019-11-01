class Proverb
  def initialize(*args, qualifier: nil)
    verbs = args
    @result = []
    verbs.each_with_index do |a, ind|
      break if ind+1 == verbs.length
      @result << "For want of a #{verbs[ind]} the #{verbs[ind+1]} was lost."
    end
    qualifier != nil ? qualifier += " " + verbs[0] : qualifier = verbs[0]
    @result << "And all for the want of a #{qualifier}."
  end

  def to_s
    @result.join("\n")
  end
end