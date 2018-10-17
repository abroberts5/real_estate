require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'

class RoomTest < MiniTest::Test
  def test_room_class_exists
    room = Room.new(:bedroom, 10, 13)
    assert_instance_of Room, room
  end

  def test_category_shows_contents
    room = Room.new(:bedroom, 10, 13)
    assert_equal :bedroom, room.category
  end

  def test_area_reads_passed_in_ value
    room = Room.new(:bedroom, 10, 13)
    assert_equal 130, room.area
  end
end
