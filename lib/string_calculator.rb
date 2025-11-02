class StringCalculator
  @@called_count = 0
  
  def self.add(input)
    @@called_count += 1
    return 0 if input.empty?
    if input.match(/-\d+/)
      negatives = input.scan(/-\d+/).join(", ")
      raise ArgumentError, "negatives not allowed: #{negatives}"
    end

    # //op:multiply\n1,2,3,4
    if input.start_with?("//")
      input = input[2..]
      delimiters, numbers_str = input.split("\n", 2)
      if delimiters.start_with?("op:")
        operator = delimiters[3..]
        if operator == "multiply"
          numbers = numbers_str.split(/[\n,]/).map(&:to_i).reject { |n| n > 1000 }
          return numbers.reduce(1, :*)
        end
      end

      if delimiters.start_with?("[") && delimiters.end_with?("]")
        delimiters = delimiters.scan(/\[[^\]]+\]/).map{|a| a[1..-2]}
      else
        delimiters = [delimiters]
      end
      numbers = numbers_str.split(Regexp.union(*delimiters)).map(&:to_i).reject { |n| n > 1000 }
      return numbers.sum
    end

    numbers = input.split(/[\n,]/).map(&:to_i).reject { |n| n > 1000 }
    numbers.sum
  end

  def self.get_called_count
    @@called_count
  end
end
