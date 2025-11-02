require_relative 'string_input_parser'

class StringCalculator
  @@called_count = 0

  def self.calculate(input)
    @@called_count += 1

    validate(input)

    parsed_input = StringInputParser.parse(input)

    case parsed_input[:operator]
    when "multiply"
      multiply(parsed_input[:delimiters], parsed_input[:numbers_str])
    else
      add(parsed_input[:delimiters], parsed_input[:numbers_str])
    end
  end

  def self.validate(input)
    return 0 if input.empty?

    if input.match(/-\d+/)
      negatives = input.scan(/-\d+/).join(", ")
      raise ArgumentError, "negatives not allowed: #{negatives}"
    end
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
    if delimiters.nil?
      numbers = numbers_str.split(/[\n,]/).map(&:to_i).reject { |n| n > 1000 }
      return numbers.reduce(1, :*)
    end

    numbers = numbers_str.split(Regexp.union(*delimiters)).map(&:to_i).reject { |n| n > 1000 }
    return numbers.reduce(1, :*)
  end

  def self.get_called_count
    @@called_count
  end
end
