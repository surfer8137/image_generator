require 'spec_helper'
require 'colour.rb'

describe 'Colour' do
  context 'creating a colour' do
    it 'will have red, green, blue and alpha' do
      red = 33
      blue = 54
      green = 56
      alpha = 128
      colour = Colour.new(red: red, blue: blue, green: green, alpha: alpha)

      expected_red = 33
      expected_blue = 54
      expected_green = 56
      expected_alpha = 128
      expect(colour.red).to eq(expected_red)
      expect(colour.blue).to eq(expected_blue)
      expect(colour.green).to eq(expected_green)
      expect(colour.alpha).to eq(expected_alpha)
    end
  end
end
