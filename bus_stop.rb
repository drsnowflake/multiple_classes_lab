class BusStop
  attr_reader(:queue)
  def initialize
    @queue = []
  end

  def add_person_to_stop(person)
    @queue << person
  end

  def empty_bus_stop
    @queue = []
  end
end
