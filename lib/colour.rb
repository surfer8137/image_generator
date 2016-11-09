require 'chunky_png'

class Colour
  RED_BITS_SHIFT = 24
  GREEN_BITS_SHIFT = 16
  BLUE_BITS_SHIFT = 8
  ALPHA_BITS_SHIFT = 0
  GREEN_BITS_MASK = 0x00FF
  BLUE_BITS_MASK =  0x0000FF
  ALPHA_BITS_MASK = 0x000000FF

  def initialize(arguments)
    @colour_bits = ChunkyPNG::Color.rgba( arguments[:red], arguments[:green], arguments[:blue], arguments[:alpha])
  end

  def red
    (@colour_bits >> RED_BITS_SHIFT)
  end

  def green
    ((@colour_bits >> GREEN_BITS_SHIFT) & GREEN_BITS_MASK)
  end

  def blue
    ((@colour_bits >> BLUE_BITS_SHIFT) & BLUE_BITS_MASK)
  end

  def alpha
    (@colour_bits &  ALPHA_BITS_MASK)
  end
end
