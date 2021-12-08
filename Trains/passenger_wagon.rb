class PassengerWagon < Wagon
  attr_accessor :occupied_places
  attr_reader :places

  def initialize(places)
    super()
    @places = places
    validate!
    @occupied_places = 0
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  def take_the_place
    self.occupied_places += 1
  end

  def free_places
    places - occupied_places
  end

  def validate!
    raise 'Places can not be zero' if places.zero?
  end
end
