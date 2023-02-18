numbers = [1, 2, 3, 4]     # This is of type Array(Int32)
numbers << 10
puts "The #{numbers.size} numbers are #{numbers}" # => The 5 numbers are [1, 2, 3, 4, 10]

# numbers << "oops"
  # Error: no overload matches 'Array(Int32)#<<' with type 
      # String


first_list = [1, 2, 3, "abc", 40]
p typeof(first_list)   # => Array(Int32 | String)
first_list << "hey!"   # Ok 
# Now all elements are unions:
element = first_list[0]
p element         # => 1
p element.class   # => Int32
p typeof(element) # => Int32 | String
# Types can also be explicit:
second_list = [1, 2, 3, 4] of Int32 | String 
p typeof(second_list)   # => Array(Int32 | String)
second_list << "hey!"   # Ok
# When declaring an empty array, an explicit type is mandatory:
empty_list = [] of Int32


list = {1, 2, "abc", 40}
p typeof(list)    # => Tuple(Int32, Int32, String, Int32)
element = list[0]
p typeof(element) # => Int32
# list << 10   # Invalid, tuples are immutable.