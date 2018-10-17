require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require './lib/house'

class HouseTest < MiniTest::Test
  def test_house_class_exists
    house = House.new("$400000", "123 sugar lane")
    assert_instance_of House, house
  end

  def test_it_has_attributes
    house = House.new("$400000", "123 sugar lane")
    assert_equal "$400000", house.price
    assert_equal "123 sugar lane", house.address
  end

  def test_rooms_start_with_empty_array
    house = House.new("$400000", "123 sugar lane")
    assert_equal [], house.rooms
  end

  def test_new_rooms_print_into_empty_array
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    assert_equal [room_1], house.add_room(room_1)
    assert_equal [room_1, room_2], house.add_room(room_2)
    assert_equal [room_1, room_2], house.rooms
  end

  def test_additional_rooms
   house = House.new("$400000", "123 sugar lane")
   room_1 = Room.new(:bedroom, 10, 13)
   room_2 = Room.new(:bedroom, 11, 15)
   room_3 = Room.new(:living_room, 25, 15)
   room_4 = Room.new(:basement, 30, 41)

   assert_equal [room_1], house.add_room(room_1)
   assert_equal [room_1, room_2], house.add_room(room_2)
   assert_equal [room_1, room_2, room_3], house.add_room(room_3)
   assert_equal [room_1, room_2, room_3, room_4], house.add_room(room_4)
  end

  def test_it_can_organize_rooms_by_category
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    room_3 = Room.new(:living_room, 25, 15)
    room_4 = Room.new(:basement, 30, 41)
    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)

    assert_equal [room_1, room_2], house.rooms_from_category(:bedroom)
    assert_equal [room_4], house.rooms_from_category(:basement)
  end

  def test_it_can_get_total_area_of_house
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    room_3 = Room.new(:living_room, 25, 15)
    room_4 = Room.new(:basement, 30, 41)
    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)

    assert_equal 1900, house.area
  end
end
