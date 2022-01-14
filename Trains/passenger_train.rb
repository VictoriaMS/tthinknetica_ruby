class PassengerTrain < Train
  def attach_wagon(wagon) 
    if wagon.class == PassengerWagon
      super(wagon)
    else
      puts 'Wagon is not passenger'
    end
  end 
end
