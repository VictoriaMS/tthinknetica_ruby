class PassengerTrain < Train
  def attach_wagon(wagon)
    if wagon.is_a?(PassengerWagon)
      super(wagon)
    else
      puts 'Wagon is not passenger'
    end
  end
end
