require('minitest/autorun')
require('minitest/reporters')

require_relative('../bus')
require_relative('../person')
require_relative('../bus_stop')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestBusStop < MiniTest::Test
  def setup
    @bus_stop1 = BusStop.new
    @bus1 = Bus.new(22, 'Ocean Terminal')
    @bus2 = Bus.new(47, 'Granton')
    @person1 = Person.new('Michael', 29)
    @person2 = Person.new('Rob', 36)
  end

  def test_add_person_to_stop
    @bus_stop1.add_person_to_stop(@person2)
  end
end
