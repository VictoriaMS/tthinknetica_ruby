vowels = ['a', 'e', 'i', 'o', 'u', 'y']

alphabet = {}
('a'..'z').each_with_index {|l, index| alphabet[l] = index + 1}

alphabet.select! { |letter, index| vowels.include?(letter) }
