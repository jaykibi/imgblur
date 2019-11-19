class Image
  def initialize(array) 
    @image = array
  end

  def output_image
    @image.each do |subarr|
      str = ""
      subarr.each do |item|
        str << item.to_s 
      end
      puts str
    end
  end    

#step 1: make copy of existing data 
#step 2: loop over subarrays of old data by indices
#step 3: loop over elements of subarrays by indices
#step 4: check if our current element is a 1 
#step 4b: update its neighbors with 1's in the COPY (flip with 4c)
#step 4c: check if neighbor is contained in the boundaries
#step 5: save updated copy over the old data 

  def blur
    #this copy is called a shallow copy
    #copy = @image
    #this copy is a deep copy
    copy = Marshal.load(Marshal.dump(@image))
    @image.each_index do |rowindex|
      @image[rowindex].each_index do |colindex|
        if @image[rowindex][colindex] == 1
          if rowindex != 0   
            copy[rowindex -1][colindex] = 1 #up
          end
          if rowindex != @image.length-1 
            copy[rowindex +1][colindex] = 1 #down
          end
          if colindex != @image[rowindex].length-1
            copy[rowindex][colindex +1] = 1 #right
          end
          if colindex != 0
            copy[rowindex][colindex -1] = 1 #left
          end
          #update neighbors with 1's 
          #gonna be nested if statement
        end
      end
    end
    @image = copy 
  end

  def blur2(distance)
    distance.times do 
      blur
    end
  end

end

image = Image.new([
  [0, 0, 0, 1],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
])

image.output_image
puts
image.blur2 2
image.output_image

