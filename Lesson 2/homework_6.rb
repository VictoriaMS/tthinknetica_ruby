products = {}
total_sum = 0 

loop do 
  puts 'Product name: '
  product_name = gets.chomp 

  break if product_name == 'Stop'    

  puts 'Price: '
  price = gets.chomp.to_f
  puts 'Number of products: '
  number = gets.chomp.to_f

  products[product_name] = { price: price, number: number, total: price * number }
end 

products.each_value{ |value| total_sum += value[:total] }

puts total_sum 
