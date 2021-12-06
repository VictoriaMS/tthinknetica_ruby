class CargoTrain < Train
  def attach_vagon(vagon) 
    if vagon.class == CargoVagon
       super(vagon)
    else
      puts 'Vagon is not cargo'
    end
  end 
end
