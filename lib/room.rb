class Room
  attr_reader :category
  
  def initialize(category, width, length)
    @category = category
    @width    = width
    @length   = length
  end

  def area
    @width * @length
  end
end
