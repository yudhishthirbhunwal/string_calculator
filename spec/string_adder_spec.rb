require "string_adder"

RSpec.describe StringAdder do
  describe ".add" do
    context "when given an empty string" do
      it "returns 0" do
        expect(StringAdder.add("")).to eq(0)
      end
    end
    
    context "when given a single number" do
      it "returns that number" do
        expect(StringAdder.add("5")).to eq(5)
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
              expect(StringAdder.add(input)).to eq(expected)
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
              expect(StringAdder.add(input)).to eq(expected)
            end
          end
        end
      end
    end
  end
  
end
