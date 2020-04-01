require 'pry'

class PigLatinizer
    attr_accessor :input
    def initialize()
        #@input = input
    end

    def piglatinize(input)      
        self.input = input          
        split_string = self.input.split(" ")
        mapped_and_converted = split_string.map{|word| convert(word)}
        reduced = mapped_and_converted.reduce{|sum, next_iter| sum = "#{sum} #{next_iter}"}        
        reduced
    end

    def convert(input)
        if(self.vowel_check(input[0]))
            return self.vowel_processor(input)
        else
            return self.consonant_processor(input)
        end
    end

    def vowel_check(input)
        vowels = "aeiou"
        if(vowels.count(input[0].downcase) > 0)
            return true
        else
            return false
        end
    end

    def vowel_processor(input)            
        return "#{input}way"   
    end

    def consonant_processor(input)        
        index = 0
        while self.vowel_check(input[index]) == false do
            index = index + 1
        end
        temp_str = input[0..index-1]
        temp_str2 = input[index..input.length]        
        return_val = "#{temp_str2}#{temp_str}ay"        
        return_val
    end


end