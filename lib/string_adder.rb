class StringAdder
  @@called_count = 0
  
  def self.add(input)
    @@called_count += 1
    return 0 if input.empty?
    if input.match(/-\d+/)
      negatives = input.scan(/-\d+/).join(", ")
      raise ArgumentError, "negatives not allowed: #{negatives}"
    end

    if input.start_with?("//")
      delimiter, numbers_str = input[2..].split("\n", 2)
      numbers = numbers_str.split(delimiter).map(&:to_i).reject { |n| n > 1000 }
      return numbers.sum
    end

    numbers = input.split(/[\n,]/).map(&:to_i).reject { |n| n > 1000 }
    numbers.sum
  end

  def self.get_called_count
    @@called_count
  end
end
