class CargoTrain < Train
  def attach_wagon(wagon)
    if wagon.is_a?(CargoWagon)
      super(wagon)
    else
      puts 'Wagon is not cargo'
    end
  end
end
