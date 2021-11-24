array = []
number = 10 

while number <= 100 do 
    array << number 
    number += 5
end 


#второй способ решения задачи 
array = (10..100).to_a
array.delete_if {|number| number % 5 != 0}


#третий способ решения задачи 
array = []

for number in (10..100) do 
    array.push(number) if number % 5 == 0
end
