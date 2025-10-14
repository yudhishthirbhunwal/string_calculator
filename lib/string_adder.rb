class StringAdder
  def self.add(input)
    return 0 if input.empty?

    if input.start_with?("//")
      delimiter, numbers_str = input[2..].split("\n", 2)
      numbers = numbers_str.split(delimiter).map(&:to_i)
      return numbers.sum
    end

    numbers = input.split(/[\n,]/).map(&:to_i)
    numbers.sum
  end
end
