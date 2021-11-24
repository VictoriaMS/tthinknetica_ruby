puts "Enter the current date"
date = gets.chomp.to_i
puts "Enter the current month"
month = gets.chomp.to_i
puts "Enter the current year"
current_year = gets.chomp.to_i

year = {1 => 31, 2 => 28, 3 => 31, 4 => 30, 
        5 => 31, 6 => 30, 7 => 31, 8 => 31, 
        9 => 30, 10 => 31, 11 => 30, 12 => 31}

day = 0         

year[2] = 29 if current_year % 400 == 0 or current_year % 4 == 0 

if month == 1 
    day = date 
else 
    year.each{ |m, d| day += d if m <= month - 1 }
    day += date 
end
