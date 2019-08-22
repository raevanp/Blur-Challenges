class Image

  def initialize(img)
    @image = img
  end

  def output_image
    @image.each do |row|
      puts row.join
    end
  end

  def blur!(distance=6)
    distance.times do
      blur_coords!
    end
  end

  private

    def blur_coords!
      blur_coords = []
      #['a','b','c','d'].each_with_index
      #0,1,2,3 <- indexes
      @image.each_with_index do |row, row_index|
        # row = [0, 0, 0, 0, 0, 0, 0, 0]
        # row_index = 0
        row.each_with_index do |column, column_index|
          # column = 0
          # column_index = 0
          blur_coords << [row_index, column_index] if column == 1
        end
      end

      blur_coords.each do |coord|
        # blur_coords = [ [1, 1], [3, 5] ]
        # coord = [1, 2]
        # [0, 0, 0, 0, 0, 0, 0, 0].length == 7
        @image[coord[0]][coord[1] + 1] = 1 if coord[1] + 1 <= @image[coord[0]].length - 1
        @image[coord[0]][coord[1] - 1] = 1 if coord[1] - 1 >= 0
        @image[coord[0] + 1][coord[1]] = 1 if coord[0] + 1 <= @image.length - 1
        @image[coord[0] - 1][coord[1]] = 1 if coord[0] - 1 >= 0
      end
    end

end

image = Image.new([
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 1, 0, 0, 0, 0, 0, 0],
  [0, 1, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 1, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
])
image.blur!(2)
image.output_image
