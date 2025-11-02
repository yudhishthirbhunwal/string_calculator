require "string_calculator"

RSpec.describe StringCalculator do
  describe ".add" do
    context "when given an empty string" do
      it "returns 0" do
        expect(StringCalculator.add("")).to eq(0)
      end
    end
    
    context "when given a single number" do
      it "returns that number" do
        expect(StringCalculator.add("5")).to eq(5)
      end
    end

    context "when given two numbers" do
      context "separated by a comma" do
        [
          ["1,2", 3],
          ["31,23", 54]
        ].each do |input, expected|
          context "given '#{input}'" do
            it "returns #{expected}" do
              expect(StringCalculator.add(input)).to eq(expected)
            end
          end
        end
      end
    end

    context "when given multiple numbers" do
      context "separated by a comma" do
        [
          ["1,2,3", 6],
          ["31,23,12,  17, 34, 4 , 9", 130]
        ].each do |input, expected|
          context "given '#{input}'" do
            it "returns #{expected}" do
              expect(StringCalculator.add(input)).to eq(expected)
            end
          end
        end
      end

      context "separated by a new-lines or commas" do
        [
          ["1\n2\n\n3", 6],
          ["31,,,23\n12,  17, 34, 4 , 9", 130]
        ].each do |input, expected|
          context "given '#{input}'" do
            it "returns #{expected}" do
              expect(StringCalculator.add(input)).to eq(expected)
            end
          end
        end
      end

      context "separated by custom delimiter" do
        [
          ["//;\n1;2;3", 6],
          ["//||\n31||23||12||17||34||4||9", 130],
          ["//|\n31|23|12|17|34|4|9", 130]
        ].each do |input, expected|
          context "given '#{input}'" do
            it "returns #{expected}" do
              expect(StringCalculator.add(input)).to eq(expected)
            end
          end
        end
      end

      context "separated by custom delimiters of any length" do
        [
          ["//[;;;]\n1;;;2;;;3", 6],
          ["//[||]\n31||23||12||17||34||4||9", 130],
          ["//[**][&&&][%]\n31&&&23%12**17%34%4&&&9", 130]
        ].each do |input, expected|
          context "given '#{input}'" do
            it "returns #{expected}" do
              expect(StringCalculator.add(input)).to eq(expected)
            end
          end
        end
      end

      context 'when given negative numbers' do
        it 'raises an error' do
          expect { StringCalculator.add("1,-2,3") }.to raise_error(ArgumentError, "negatives not allowed: -2")
          expect { StringCalculator.add("1,-2,-5,3") }.to raise_error(ArgumentError, "negatives not allowed: -2, -5")
        end
      end

      context 'when given numbers greater than 1000' do
        it 'ignores them' do
          expect(StringCalculator.add("2,1001")).to eq(2)
          expect(StringCalculator.add("1001,1002,1003,4")).to eq(4)
        end
      end

      context 'when given an operator as multiply' do
        it 'returns the product of the numbers' do
          expect(StringCalculator.add("//op:multiply\n1,2,3,4")).to eq(24)
        end
      end
    end
  end

  describe ".get_called_count" do
    it "returns the number of times add was called" do
      StringCalculator.class_variable_set(:@@called_count, 0)
      expect(StringCalculator.get_called_count).to eq(0)
      StringCalculator.add("1,2")
      expect(StringCalculator.get_called_count).to eq(1)
      StringCalculator.add("3,4")
      StringCalculator.add("5,6")
      expect(StringCalculator.get_called_count).to eq(3)
    end
  end
  
end
