require 'chunky_png'

class Image
  attr_reader :width, :height

  def initialize(width, height)
    @width = width
    @height = height
    @image_chunks =  ChunkyPNG::Image.new(@width, @height, ChunkyPNG::Color::TRANSPARENT)
  end

  def save_as(filename)
    @image_chunks.save(filename << '.png', :interlace => true)

    'success'
  end

  def change_pixel_color(x_position, y_position, color)
    @image_chunks[x_position, y_position] = color
  end

  def pixel_color(x_position, y_position)
    @image_chunks[x_position, y_position]
  end
end
