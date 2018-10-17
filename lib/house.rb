class House
  attr_reader     :price,
                  :address,
                  :rooms

  def initialize(price, address)
    @price    = price
    @address  = address
    @rooms    = []
  end

  def add_room(new_room)
    @rooms << new_room
  end

  def rooms_from_category(category)
    by_category = []
    @rooms.find_all do |room|
      if room.category == category
        by_category << room
      end
    end
    by_category
  end

  def area
    area_array = []
    @rooms.each do |room|
      area_array << room.area
    end
    area_array.sum
  end

  def price_per_square_foot
    new_price = @price.delete("$").to_i
    output = new_price / area.to_f
    output.round(2)
  end
end
