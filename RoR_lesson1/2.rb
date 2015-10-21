# Earth: orbital period 365.25 Earth days, or 31557600 seconds
puts "Hi! Enter your birth date. Format \"dd-mm-yyyy\"."
bornDate = gets.chomp
bornTime = "00-00-00"; resultStatus = "approximate, because birth time was not provided :("

puts "Do you remember the time, including seconds, you were born at? Answer \"yes\" or \"no\" "
timeAnswer = gets.chomp

if timeAnswer == "no"
    puts "\nIt's ok, don't worry, we'll find a way to fix it!"
elsif timeAnswer == "yes"
    puts "\nFantastic! Type your born time using this format \"hh-mm-ss\""
    bornTime = gets.chomp; resultStatus = "exact"
elsif
    puts "\n- Said yor mom. XD ) Ok, let's skip this mess.."
end

paramsDateTime = bornDate.split("-").reverse + bornTime.split("-")
bornDateTime = Time.new(*paramsDateTime)

def calculateAge(source, status)
    
    bornDateTime = source
    distanceInSeconds = Time.now - bornDateTime
    distanceInMinutes = distanceInSeconds / 60
    distanceInHours = distanceInMinutes / 60
    distanceInDays = distanceInHours / 24
    distanceInYears = (distanceInDays.to_f / 365.25).to_f
    
    puts "\nYour live distance: \n"
    puts "#{distanceInSeconds.to_i} seconds \n"
    puts "#{distanceInMinutes.to_i} minutes \n"
    puts "#{distanceInHours.to_i} hours \n"
    puts "#{distanceInDays.to_i} days \n"
    puts "#{distanceInYears.round(1)} years \n\n"
    
    puts "Result is #{status} \n\n"
    
end

calculateAge(bornDateTime, resultStatus)
