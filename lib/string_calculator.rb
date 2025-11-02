class StringCalculator
  @@called_count = 0

  def self.calculate(input)
    @@called_count += 1

    validate(input)

    if input.start_with?("//")
      input = input[2..]

      operation_str, numbers_str = input.split("\n", 2)[0], input.split("\n", 2)[1]

      operator = get_operator(operation_str)
      delimiters = get_delimiters(operation_str)

      case operator
      when "multiply"
        return send(:multiply, delimiters, numbers_str)
      else
        return send(:add, delimiters, numbers_str)
      end
    end

    return send(:add, nil, input)
  end

  def self.validate(input)
    return 0 if input.empty?

    if input.match(/-\d+/)
      negatives = input.scan(/-\d+/).join(", ")
      raise ArgumentError, "negatives not allowed: #{negatives}"
    end
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

  def self.add(delimiters, numbers_str)
    if delimiters.nil?
      numbers = numbers_str.split(/[\n,]/).map(&:to_i).reject { |n| n > 1000 }
      return numbers.sum
    end

    numbers = numbers_str.split(Regexp.union(*delimiters)).map(&:to_i).reject { |n| n > 1000 }
    numbers.sum
  end

  def self.multiply(delimiters, numbers_str)
    numbers = numbers_str.split(/[\n,]/).map(&:to_i).reject { |n| n > 1000 }
    return numbers.reduce(1, :*)
  end

  def self.get_called_count
    @@called_count
  end
end
