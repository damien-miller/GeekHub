# Works proper only with "gets" command! Put summands in brakets if you want to test method in console

puts "Please, enter the digits. Format \"2+2\". Remember, this program only sums!"
source = gets.chomp
puts "Your summands are: #{source.split('+').join(", ")}"

def calculateNumbers(source)
    sum = 0
    source.split('+').each {|e| sum += e.to_i}
    puts "Your sum is: #{sum}"
end

calculateNumbers(source)