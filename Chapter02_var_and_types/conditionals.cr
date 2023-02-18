# if statemant
secret_number = rand(1..5) # A random integer between 1 and 5
print "Please input your guess: "
guess = read_line.to_i
if guess == secret_number
  puts "You guessed correctly!"
else
  puts "Sorry, the number was #{secret_number}."
end

# or

msg = if !guess.in? 1..5
    "Please input a number between 1 and 5."
  elsif guess == secret_number
    "You guessed correctly!"
  else
    "Sorry, the number was #{secret_number}."
  end
puts msg

# or 

puts "You guessed #{guess == secret_number ? "correctly" : "incorrectly"}!"

# unless
unless guess.in? 1..5
    puts "Please input a number between 1 and 5."
end

puts "Please input a number between 1 and 5." unless guess.in? 1..5

# case

case Time.local.month
when 1, 2, 3
  puts "We a on the first quarter"
when 4, 5, 6
  puts "We a on the second quarter"
when 7, 8, 9
  puts "We a on the third quarter"
when 10, 11, 12
  puts "We a on the fourth quarter"
end

# or

case Time.local.month
when 1..3
  puts "We a on the first quarter"
when 4..6
  puts "We a on the second quarter"
when 7..9
  puts "We a on the third quarter"
when 10..12
  puts "We a on the fourth quarter"
end

# case coparing types

int_or_string = rand(1..2) == 1 ? 10 : "hello"
case int_or_string
when Int32
  puts "It's an integer"
when String
  puts "It's a string"
end

# case else

case rand(1..10)
when 1..3
  puts "I am a cat"
when 4..6
  puts "I am a dog"
else
  puts "I am a random animal"
end

# while

secret_number = rand(1..5)
print "Please input your guess: "
guess = read_line.to_i
while guess != secret_number
  puts "Sorry, that's not it. Please try again: "
  guess = read_line.to_i
end
puts "You guessed correctly!"

# untill

secret_number = rand(1..5)
print "Please input your guess: "
guess = read_line.to_i
until guess == secret_number
  puts "Sorry, that's not it. Please try again: "
  guess = read_line.to_i
end
puts "You guessed correctly!"

# while with break and next

secret_number = rand(1..5)
while true
  print "Please input your guess (zero to give up): "
  guess = read_line.to_i
  if guess < 0 || guess > 5
    puts "Invalid guess. Please try again."
    next
  end
  if guess == 0
    puts "Sorry, you gave up. The answer was 
      #{secret_number}."
    break
  elsif guess == secret_number
    puts "Congratulations! You guessed the secret number!"
    break
  end
  puts "Sorry, that's not it. Please try again."
end