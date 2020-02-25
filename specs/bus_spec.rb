require('minitest/autorun')
require('minitest/reporters')

require_relative('../bus')
require_relative('../person')
require_relative('../bus_stop')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestBus < MiniTest::Test
  def setup
    @bus1 = Bus.new(22, 'Ocean Terminal')
    @bus2 = Bus.new(47, 'Granton')
    @person1 = Person.new('Michael', 29)
    @person2 = Person.new('Rob', 36)
    @bus_stop1 = BusStop.new
  end

  def test_bus_route
    assert_equal(22, @bus1.route_number)
  end

  def test_bus_destination
    assert_equal('Granton', @bus2.destination)
  end

  def test_bus_drive_method
    assert_equal('Brum brum', @bus1.drive_method)
  end

  def test_current_passenger_count
    assert_equal(0, @bus1.current_passenger_count)
  end

  def test_pick_up_passenger
    @bus1.pick_up_passenger(@person1)
    assert_equal(1, @bus1.passengers.length)
  end

  def test_drop_off_passenger
    @bus2.pick_up_passenger(@person1)
    @bus2.drop_off_passenger(@person1)
    assert_equal(0, @bus2.passengers.length)
  end

  def test_empty_bus
    @bus2.pick_up_passenger(@person1)
    @bus2.pick_up_passenger(@person1)
    @bus2.pick_up_passenger(@person1)
    @bus2.empty_bus
    assert_equal(0, @bus2.passengers.length)
  end

  def test_pick_up_from_stop
    @bus_stop1.add_person_to_stop(@person1)
    @bus_stop1.add_person_to_stop(@person2)
    @bus1.pick_up_from_stop(@bus_stop1)
    assert_equal(2, @bus1.passengers.length)
    assert_equal(0, @bus_stop1.queue.length)
  end
end
