require 'rubygems'
require 'png'

# png_gradient = PNGGradient.new(100, 100, '#409947', '#449984')
# png_gradient.save('new.png')

class String
  def hex2dec 
     [self.delete(" ").delete("#")].pack("H*").unpack("C*")
  end
end

class PNGGradient
  
  def initialize(w, h, ca1, ca2)
    @w   = w
    @h   = h
    Array === ca1 ? @ca1 = ca1 : @ca1 = ca1.hex2dec
    Array === ca2 ? @ca2 = ca2 : @ca2 = ca2.hex2dec
  end
  
  def canvas
    return @canvas if @canvas
    @canvas = PNG::Canvas.new(@w, @h)
    (@h).times do |i|
      d = i.to_f/(@h)
      r, g, b = (@ca1[0]*d + @ca2[0]*(1-d)), 
                (@ca1[1]*d + @ca2[1]*(1-d)), 
                (@ca1[2]*d + @ca2[2]*(1-d))
      c = PNG::Color.new(r,g,b)
      (@w).times do |j|
        @canvas[(@w-1)-j, (@h-1)-i]=c
      end
    end
    @canvas
  end
  
  def save(file_name)
    png = PNG.new(self.canvas)
    png.save file_name
  end
  
  def to_blob()
    png = PNG.new(self.canvas)
    png.to_blob()
  end
  
end