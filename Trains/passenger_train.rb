class PassengerTrain < Train
  def attach_vagon(vagon) 
    if vagon.class == PassengerVagon
      super(vagon)
    else
      puts 'Vagon is not passenger'
    end
  end 
end
