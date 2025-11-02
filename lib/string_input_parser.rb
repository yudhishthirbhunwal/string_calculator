class StringInputParser
  def self.parse(input)

    if input.start_with?("//")
      input = input[2..]
      operation_str, numbers_str = input.split("\n", 2)[0], input.split("\n", 2)[1]

      operator = get_operator(operation_str)
      delimiters = get_delimiters(operation_str)

      return output(numbers_str, operator, delimiters)
    else
      return output(input)
    end
    
  end

  def self.output(numbers_str = "", operation_str = :add, delimiters = nil)
    {
      operator: operation_str,
      delimiters: delimiters,
      numbers_str: numbers_str
    }
  end

  def self.get_operator(input)
    if input.start_with?("op:")
      return input.split(';', 2)[0][3..]
    end
    nil
  end

  def self.get_delimiters(input)
    if input.start_with?("op:")
      input = input.split(';', 2)[1]
    end

    return nil if input.nil? || input.empty?

    if input.start_with?("[") && input.end_with?("]")
      delimiters = input.scan(/\[[^\]]+\]/).map{|a| a[1..-2]}
    else
      delimiters = [input]
    end

    return delimiters
  end
end
