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
  end
  
end
