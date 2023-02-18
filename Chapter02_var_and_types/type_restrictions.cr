def show(value : String)
    puts "The string is '#{value}'"
end
def show(value : Int)
puts "The integer is #{value}"
end


show(12)      # => The integer is 12
show("hey")   # => The string is 'hey'
show(3.14159) # Error: no overload matches 'show' with type 
# Float64
x = rand(1..2) == 1 ? "hey" : 12
show(x)  # => Either "The integer is 12" or "The string is 
# 'hey'"



def show_type(value : Int | String)
    puts "Compile-time type is #{typeof(value)}."
    puts "Runtime type is #{value.class}."
    puts "Value is #{value}."
  end
show_type(10)
# => Compile-time type is Int32.
# => Runtime type is Int32.
# => Value is 10.
x = rand(1..2) == 1 ? "hello" : 5_u8
show_type(x) 
# => Compile-time type is (String | UInt8).
# => Runtime type is String.
# => Value is hello.



def add(a, b) : Int
    a + b
end
add 1, 3     # => 4
add "a", "b" # Error: method top-level add must return Int 
# but it is returning String