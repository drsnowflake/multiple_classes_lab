class Bus
  attr_reader :route_number, :destination, :passengers

  def initialize(route_number, destination)
    @route_number = route_number
    @destination = destination
    @passengers = []
  end

  def drive_method
    'Brum brum'
  end

  def current_passenger_count
    @passengers.length
  end

  def pick_up_passenger(passenger)
    @passengers << passenger
  end

  def drop_off_passenger(passenger)
    @passengers.delete(passenger)
  end

  def empty_bus
    @passengers = []
  end

  def pick_up_from_stop(stop)
    stop.queue.each do |passenger|
      pick_up_passenger(passenger)
    end
    stop.empty_bus_stop
  end
end
