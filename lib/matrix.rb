class Matrix
    attr_reader :rows, :columns
  
    def initialize(matrix_string)
		@rows = extract_rows(matrix_string)
		@columns = @rows.transpose
    end
  
    private
  
    def extract_rows(matrix_string)
		matrix_string.each_line.map do |row|
			row.split.map(&:to_i)
		end
    end
end