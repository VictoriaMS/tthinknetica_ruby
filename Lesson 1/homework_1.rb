puts 'What is your name?'
name = gets.chomp 

puts 'How tall are you?'
height = gets.chomp.to_i

ideal_weight = height - 110 

if ideal_weight < 0 
  puts 'Your weight is already optimal'
else 
  puts "#{name}, your ideal weight is #{ideal_weight}"
end
