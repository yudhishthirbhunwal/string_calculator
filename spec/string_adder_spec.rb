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
        context "given '1,2'" do
          it "returns 3" do
            expect(StringAdder.add("1,2")).to eq(3)
          end
        end

        context "given '31,23'" do
          it "returns 54" do
            expect(StringAdder.add("31,23")).to eq(54)
          end
        end
      end
    end
  end
  
end
