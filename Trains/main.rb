require_relative 'train'
require_relative 'station'
require_relative 'route'
require_relative 'vagon'
require_relative 'cargo_train'
require_relative 'cargo_vagon'
require_relative 'passenger_vagon'
require_relative 'passenger_train'

loop do
  puts '1. Create station'
  puts '2. Create train'
  puts '3. Create route'
  puts '4. Create vagon'
  puts '5. Change route'
  puts '6. Assign a route to a train'
  puts '7. Chanse the number of wagons'
  puts '8. Move the train'
  puts '9. Show all stations'
  puts '10. Show the list of trains at the station'
  puts '0. Stop'

  input = gets.chomp.to_i

  break if input == 0

  case input 
  when 1 
    puts 'Enter station name'
    station_name = gets.chomp
    Station.new(station_name)
  when 2 
    puts '1. Create passenger train'
    puts '2. Create cargo train'
    type_train = gets.chomp.to_i 

    puts 'Enter train number'
    number_train = gets.chomp

    type_train == 1 ? PassengerTrain.new(number_train) : CargoTrain.new(number_train)
  when 3 
    puts 'Choose first station'
    first_station = choose_station

    puts 'Choose last station'
    last_station = choose_station

    Route.new(first_station, last_station)
  when 4 
    puts '1. Create passenger vagon'
    puts '2. Create cargo vagon'
    type_vagon = gets.chomp.to_i

    type_vagon == 1 ? PassengerVagon.new : CargoVagon.new
  when 5 
    puts 'Choose route'
    route = choose_route

    puts '1. Add a station'
    puts '2. Delete a station'
    input = gets.chomp.to_i

    if input == 1 
      station = choose_station
      route.add_station(station)
    else 
      puts 'Choose station'
      route.stations.each_with_index{ |station, index| puts "#{index + 1}. #{station.name}" }
      sttaion = route.stations[gets.chomp.to_i - 1]
      route.delete_station(station)
    end

  when 6 
    puts 'Choose train'
    train = choose_train
    
    puts 'Choose route'
    route = choose_route
    
    train.route = route
  when 7
    puts 'Choose train'
    train = choose_train

    puts '1. Attach_vagon'
    puts '2. Unhook vagon'
    input = gets.chomp.to_i
    
    if input == 1 
      puts 'Choose vagon'
      vagon = choose_vagon
      train.attach_vagon(vagon)
    else 
      puts 'Choose vagon'
      train.vagons.each_with_index{|vagon, index| puts "#{index - 1}. #{vagon}"}
      vagon = train.vagons[gets.chomp.to_i - 1]
      train.unhook_vagon(vagon)
    end
  when 8 
    puts 'Choose train'
    train = choose_train

    puts '1. Moving forward'
    puts '2. Moving back'
    input = gets.chomp.to_i

    input == 1 ? train.moving_forward : train.moving_back
  when 9
    list_stations
  when 10
    puts 'Choose station'
    station = choose_station
      
    station.trains.each_with_index{ |train, index| puts "#{index + 1 }. Train with number #{train.number}" }
  end



  def choose_station 
    list_stations
    index = gets.chomp.to_i 
    Station.all_stations[index - 1]
  end 

  def choose_route
    list_routes
    index = gets.chomp.to_i
    Route.routes[index - 1]
  end

  def choose_train
    list_tarins
    index = gets.chomp.to_i
    Train.trains[index - 1]
  end

  def choose_vagon
    list_vagons
    index = gets.chomp.to_i 
    Vagon.vagons[index - 1]
  end

  def list_stations
    Station.all_stations.each_with_index{ |station, index| puts "#{index + 1}. #{station.name}"}
  end
 
  def list_routes
    Route.routes.each_with_index{ |route, index| puts "#{index + 1}. #{route.stations.first.name} - #{route.stations.last.name}" } 
  end

  def list_tarins
    Train.trains.each_with_index{ |train, index| puts "#{index + 1}. Train with number: #{train.number}" }
  end

  def list_vagons 
    Vagon.vagons.each_with_index{ |vagon, index| puts "#{index + 1}. #{vagon} "}
  end
end

