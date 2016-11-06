require 'chunky_png'

def normailize_color(color)
  color = 0 if color < 0
  color = 255 if color > 255

  color
end

puts 'Launching...'

distance = ARGV[0].to_i || 1
picture_width = ARGV[1].to_i || 640
picture_height = ARGV[2].to_i || 480

random_generator = Random.new
png = ChunkyPNG::Image.new(picture_width, picture_height, ChunkyPNG::Color::TRANSPARENT)

red = random_generator.rand(0..255)
green =random_generator.rand(0..255)
blue = random_generator.rand(0..255)

png[0,0] = ChunkyPNG::Color.rgba(red, green,blue, 255)

picture_width.times do |x|
  picture_height.times do |y|
    if (x == 0 && y == 0)

    elsif (x == 0)
      parent_color_red = (png[x, y-1] >> 24)
      parent_color_green = ((png[0,0] >> 16) & 0x00FF)
      parent_color_blue = ((png[0,0] >> 8) & 0x0000FF)

      red = normailize_color(random_generator.rand((parent_color_red - distance)..(parent_color_red + distance)))
      green = normailize_color(random_generator.rand((parent_color_green - distance)..(parent_color_green + distance)))
      blue = normailize_color(random_generator.rand((parent_color_blue - distance)..(parent_color_blue + distance)))

      png[x,y] = ChunkyPNG::Color.rgba(red, green, blue, 255)
    elsif (y == 0)
      parent_color_red =  (png[x-1, y] >> 24)
      parent_color_green = ((png[0,0] >> 16) & 0x00FF)
      parent_color_blue = ((png[0,0] >> 8) & 0x0000FF)

      red = normailize_color(random_generator.rand((parent_color_red - distance)..(parent_color_red + distance)))
      green = normailize_color(random_generator.rand((parent_color_green - distance)..(parent_color_green + distance)))
      blue = normailize_color(random_generator.rand((parent_color_blue - distance)..(parent_color_blue + distance)))

      png[x,y] = ChunkyPNG::Color.rgba(red, green, blue, 255)
    else
      parent_color_red =  (png[x-1, y-1] >> 24)
      parent_color_green = ((png[0,0] >> 16) & 0x00FF)
      parent_color_blue = ((png[0,0] >> 8) & 0x0000FF)

      red = normailize_color(random_generator.rand((parent_color_red - distance)..(parent_color_red + distance)))
      green = normailize_color(random_generator.rand((parent_color_green - distance)..(parent_color_green + distance)))
      blue = normailize_color(random_generator.rand((parent_color_blue - distance)..(parent_color_blue + distance)))

      png[x,y] = ChunkyPNG::Color.rgba(red, green, blue, 255)
    end
  end
end

png.save('filename.png', :interlace => true)

puts 'Finished...'
