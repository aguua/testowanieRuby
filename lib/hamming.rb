class Hamming
    def self.compute(dna1, dna2)
        raise ArgumentError if dna1.length != dna2.length

        dna1 = dna1.split("")
        dna2 = dna2.split("")
    
        dna1.zip(dna2).select { |pair| pair[0] != pair[1] }.count
      end
end