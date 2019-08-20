class Image

  def initialize(img)
   @image = img
  end

  def output_image
    @image.each do |row|
      # each array must be on its own line in the console
        puts row.join 
    end
  end


end






image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.output_image


