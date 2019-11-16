class Image
  def initialize(array) 
    @image = array
  end

  def blur
    #this copy is called a shallow copy
    #copy = @image
    #this copy is a deep copy
    copy = Marshal.load(Marshal.dump(@image))
    @image.each_index do |rowindex|
      @image[rowindex].each_index do |colindex|
        if @image[rowindex][colindex] == 1 
          @image[rowindex +1][colindex] = 1 #up
          @image[rowindex -1][colindex] = 1 #down
          @image[rowindex][colindex +1] = 1 #right
          @image[rowindex][colindex -1] = 1 #left
          #update neighbors with 1's 
        end
      end
    end
    @image = copy 
    @image.each do |subarr|
      str = ""
      subarr.each do |val|
        str << val.to_s
      end
      puts str
  end

  # def output_image
  #   @image.each do |subarr|
  #     str = ""
  #     subarr.each do |val|
  #       str << val.to_s 
  #     end
  #     puts str
  #   end
  # end 
    
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])

# image.output_image
# puts "\n"
image.blur
end
