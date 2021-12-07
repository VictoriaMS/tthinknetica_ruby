require_relative 'instance_counter'
require_relative 'manufacture_company'
require_relative 'train'
require_relative 'station'
require_relative 'route'
require_relative 'wagon'
require_relative 'cargo_train'
require_relative 'cargo_wagon'
require_relative 'passenger_wagon'
require_relative 'passenger_train'

loop do
  puts '1. Create station'
  puts '2. Create train'
  puts '3. Create route'
  puts '4. Create wagon'
  puts '5. Change route'
  puts '6. Assign a route to a train'
  puts '7. Change the number of wagons'
  puts '8. Move the train'
  puts '9. Show all stations'
  puts '10. Show the list of trains at the station'
  puts '11. Show a list of train wagons'
  puts '12. Control of a wagon'
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
    
    begin
      puts 'Enter train number'
      number_train = gets.chomp

      type_train == 1 ? PassengerTrain.new(number_train) : CargoTrain.new(number_train)
      puts 'Train created'
    rescue RuntimeError => e 
      puts e.message
      retry
    end
  when 3 
    puts 'Choose first station'
    first_station = choose_station

    puts 'Choose last station'
    last_station = choose_station

    Route.new(first_station, last_station)
  when 4 
    puts '1. Create passenger wagon'
    puts '2. Create cargo wagon'
    type_wagon = gets.chomp.to_i

    if type_wagon == 1 
      puts 'Enter number of available places '
      PassengerWagon.new(gets.chomp.to_i)
    else 
      puts 'Enter volume'
      CargoWagon.new(gets.chomp.to_i)
    end
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

    puts '1. Attach_wagon'
    puts '2. Unhook wagon'
    input = gets.chomp.to_i
    
    if input == 1 
      puts 'Choose wagon'
      wagon = choose_wagon
      train.attach_wagon(wagon)
    else 
      puts 'Choose wagon'
      train.wagons.each_with_index{|wagon, index| puts "#{index - 1}. #{wagon}"}
      wagon = train.wagons[gets.chomp.to_i - 1]
      train.unhook_wagon(wagon)
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
    
    station.each_train do |train|
      if train.class == PassengerTrain
        puts "Number: #{train.number}, type: passenger, wagons: #{train.wagons.size}"
      else 
        puts "Number: #{train.number}, type: cargo, wagons: #{train.wagons.size}"
      end
    end
  when 11 
    puts "Choose train"
    train = choose_train

    train.each_wagon do |wagon|
      number = train.wagons.index(wagon) + 1
      if wagon.class == PassengerWagon
        puts "Number: #{number}, type: passenger, 
             free places: #{wagon.free_places}, 
             occupied places: #{wagon.occupied_places}"
      else 
        puts "Number: #{number}, type: cargo,
             free volume: #{wagon.free_volume},
             filled_volume: #{wagon.filled_volume}"
      end
    end
  when 12 
    puts 'Choose wagon'
    wagon = choose_wagon

    if wagon.class == PassengerWagon
      wagon.take_the_place
    else 
      puts'How much volume to fill?'
      wagon.fill_the_volume(gets.chomp.to_i)
    end
  end



  def choose_station 
    list_stations
    index = gets.chomp.to_i 
    Station.all[index - 1]
  end 

  def choose_route
    list_routes
    index = gets.chomp.to_i
    Route.all[index - 1]
  end

  def choose_train
    list_trains
    index = gets.chomp.to_i
    Train.all[index - 1]
  end

  def choose_wagon
    list_wagons
    index = gets.chomp.to_i 
    Wagon.all[index - 1]
  end

  def list_stations
    Station.all.each.with_index{ |station, index| puts "#{index + 1}. #{station.name}"}
  end
 
  def list_routes
    Route.all.each.with_index{ |route, index| puts "#{index + 1}. #{route.stations.first.name} - #{route.stations.last.name}" } 
  end

  def list_trains
    Train.all.each.with_index{ |train, index| puts "#{index + 1}. Train with number: #{train.number}" }
  end

  def list_wagons 
    Wagon.all.each.with_index{ |wagon, index| puts "#{index + 1}. #{wagon} "}
  end
end

