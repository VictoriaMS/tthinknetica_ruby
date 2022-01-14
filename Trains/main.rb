require_relative 'train'
require_relative 'station'
require_relative 'route'
require_relative 'wagon'
require_relative 'cargo_train'
require_relative 'cargo_wagon'
require_relative 'passenger_wagon'
require_relative 'passenger_train'


class App
  
  def initialize
    start_application
  end

  private

  def start_application
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
      puts '0. Stop'

      input = gets.chomp.to_i

      break if input == 0

      case input 
      when 1 
        create_station
      when 2 
        create_train
      when 3 
        create_route
      when 4 
        create_wagon
      when 5 
        change_route
      when 6 
        assign_route
      when 7
        change_number_of_wagons
      when 8 
        move_train
      when 9
        show_stations
      when 10
        trains_on_station
      end
    end
  end

  def create_station
    puts 'Enter station name'
    station_name = gets.chomp
    Station.new(station_name)
  end 

  def create_train
    puts '1. Create passenger train
          2. Create cargo train'

    input = gets.chomp.to_i
    puts 'Enter the number of train'
    number = gets.chomp

    input == 1 ? PassengerTrain.new(number) : CargoTrain.new(number)
  end

  def create_route
    first_station = choose_station
    last_station = choose_station

    Route.new(first_station, last_station)
  end

  def create_wagon
    puts '1. Create passenger wagon
          2. Create cargo wagon'
    input = gets.chomp.to_i

    input == 1 ? PassengerWagon.new : CargoWagon.new
  end

  def change_route
    route = choose_route

    puts '1. Add a station
          2. Delete a station'
    input = gets.chomp.to_i

    if input == 1 
      route.add_station(choose_station)
    else 
      puts 'Choose station'
      route.stations.each.with_index(1) { |station, index| puts "#{index}. #{station.name}" }
      station = route.stations[gets.chomp.to_i - 1]
      route.delete_station(station)
    end
  end

  def assign_route
    train = choose_train
    route = choose_route
    
    train.route = route
  end

  def change_number_of_wagons
    train = choose_train

    puts '1. Attach_wagon
          2. Unhook wagon'
    input = gets.chomp.to_i
    
    if input == 1
      train.attach_wagon(choose_wagon)
    else 
      puts 'Choose wagon'
      train.wagons.each.with_index(1) {|wagon, index| puts "#{index}. #{wagon}"}
      wagon = train.wagons[gets.chomp.to_i - 1]
      train.unhook_wagon(wagon)
    end
  end

  def move_train
    train = choose_train

    puts '1. Moving forwad
          2. Moving back'
    input = gets.chomp.to_i

    input == 1 ? train.moving_forward : train.moving_back
  end

  def show_stations
    Station.all.each.with_index(1) { |station, index| puts "#{index}. #{station.name}"}
  end

  def trains_on_station
    station = choose_station  
      
    station.trains.each.with_index(1) { |train, index| puts "#{index}. Train with number #{train.number}" }
  end

  def choose_station 
    puts 'Choose station'
    show_stations
    index = gets.chomp.to_i 
    Station.all[index - 1]
  end 

  def choose_route
    puts 'Choose route'
    Route.all.each.with_index(1) { |route, index| puts "#{index}. #{route.stations.first.name} - #{route.stations.last.name}" } 
    index = gets.chomp.to_i
    Route.all[index - 1]
  end

  def choose_train
    puts 'Choose train'
    Train.all.each.with_index(1) { |train, index| puts "#{index}. #{train.number}" } 
    index = gets.chomp.to_i
    Train.all[index - 1]
  end

  def choose_wagon
    puts 'Choose wagon'
    Wagon.all.each.with_index(1) { |wagon, index| puts "#{index}. #{wagon} "}
    index = gets.chomp.to_i 
    Wagon.all[index - 1]
  end
end
