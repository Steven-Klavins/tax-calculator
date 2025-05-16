require 'rails_helper'
require 'spec_helper'

RSpec.describe Calculator do

  describe "calculate_tax" do
    it "should return an accurate amount of tax for $10000" do
      expect(Calculator.calculate_tax("NZ", 10000)).to eq(1050.00)
    end

    it "should return an accurate amount of tax for $35000" do
      expect(Calculator.calculate_tax("NZ", 35000)).to eq(5033.00)
    end

    it "should return an accurate amount of tax for $100000" do
      expect(Calculator.calculate_tax("NZ", 100000)).to eq(22877.50)
    end

    it "should return an accurate amount of tax for $220000" do
      expect(Calculator.calculate_tax("NZ", 220000)).to eq(64877.50)
    end
  end
end
