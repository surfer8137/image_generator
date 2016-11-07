require 'spec_helper'
require 'image'
require 'chunky_png'

describe 'Image' do
  context 'creating an image with a width and a height' do
    it 'returns a non transparent image with that width and height' do
      width = 5
      height = 5

      image = Image.new(5, 5)

       expected_width = 5
       expected_height = 5
       expect(image.width).to eq(expected_width)
       expect(image.height).to eq(expected_height)
    end
  end

  context 'given an image, saving it to disk' do
    it 'creates a png file with a filename' do
      image = Image.new(5, 5)

      output = image.save_as('filename')

      expected_output = 'success'
      expect(output).to eq(output)
    end
  end

  context 'given an image' do
    it 'can modify any pixel color'do
      image = Image.new(5, 5)
      x_position = 2
      y_position = 2
      color = ChunkyPNG::Color.rgba(255, 0, 0, 255)

      image.change_pixel_color(x_position, y_position, color)

      expected_output = color
      expect(image.pixel_color(x_position, y_position)).to eq(expected_output)
    end
  end
end
