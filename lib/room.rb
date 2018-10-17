class Room
  attr_reader :category,
              :area

  def initialize(category, area_width, area_length)
    @category = category
    @area     = area_width * area_length
  end
end
