puts "Enter the first side of the triangle: "
a = gets.chomp.to_i

puts "Enter the second side of the triangle: "
b = gets.chomp.to_i

puts "Enter the third side of the triangle: "
c = gets.chomp.to_i

if a > b and a > c 
    hypotenuse = a 
    first_side = b
    second_side = c
elsif b > a and b > c 
    hypotenuse = b 
    first_side = a 
    second_side = c
else 
    hypotenuse = c
    first_side = a
    second_side = b 
end 

right_triangle = first_side ** 2 + second_side ** 2 == hypotenuse ** 2 

puts "Triangle is equilateral" if a == b and a == c  
puts "Triangle is right" if right_triangle
puts "Triangle is isosceles" if a == b or b == c or c == a



#Второй способ решения 
sides = []
puts "Enter the first side of the triangle: "
sides << gets.chomp.to_i

puts "Enter the second side of the triangle: "
sides << gets.chomp.to_i

puts "Enter the third side of the triangle: "
sides << gets.chomp.to_i

sides = sides.sort 

first_side = sides[0]
second_side = sides[1]
third_side = sides[2]

right_triangle = first_side ** 2 + second_side ** 2 == third_side ** 2 

puts "Triangle is equilateral" if first_side == second_side and first_side == third_side  
puts "Triangle is right" if right_triangle
puts "Triangle is isosceles" if first_side == second_side or second_side == third_side or third_side == first_side