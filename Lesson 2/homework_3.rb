array = [0, 1]
sum_two_numbers = array[-1] + array[-2]
while sum_two_numbers < 100 do 
    array << sum_two_numbers
    sum_two_numbers = array[-1] + array[-2]
end
