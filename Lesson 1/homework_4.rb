puts "Enter three numbers"
a = gets.chomp.to_i
b = gets.chomp.to_i
c = gets.chomp.to_i 

discriminant = b ** 2 - (4 * a * c)

if discriminant < 0 
    puts "Discriminant = #{discriminant}. Don't have roots!"
elsif discriminant == 0 
    x1 = (-b + Math.sqrt(discriminant)) / 2 * a 
    puts "Discriminant equals #{discriminant} and root equals #{x1} "    
else 
    x1 = (-b + Math.sqrt(discriminant)) / 2 * a 
    x2 = (-b - Math.sqrt(discriminant)) / 2 * a 
    puts "Discriminant equals #{discriminant}. First root equals #{x1} and second root equals #{x2}"
end