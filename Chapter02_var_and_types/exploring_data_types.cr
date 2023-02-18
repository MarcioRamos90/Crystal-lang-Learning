a = 10
p typeof(a) # => Int32
# Change 'a' to be a String
a = "hello"
p typeof(a) # => String
# Maybe change 'a' to be a Float64
if rand(1..2) == 1
  a = 1.5
  p typeof(a) # => Float64
end
# Now the variable 'a' could be either a String or a Float64
p typeof(a) # => String | Float64
# But we can know during runtime what type it is
if a.is_a? String
  puts "It's a String"
  p typeof(a) # => String
else
  puts "It's a Float64"
  p typeof(a) # => Float64
end
# The type of 'a' was filtered inside the conditional, but 
  # didn't change
p typeof(a) # => String | Float64
# You can also use .class to get the runtime type
puts "It's a #{a.class}"