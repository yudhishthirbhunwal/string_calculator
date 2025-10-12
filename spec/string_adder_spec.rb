require "string_adder"

RSpec.describe StringAdder do
  describe ".add" do
    context "when given an empty string" do
      it "returns 0" do
        expect(StringAdder.add("")).to eq(0)
      end
    end
end
