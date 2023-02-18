def random_score(base, max = 10)
    base + rand(0..max)
  end
p random_score(5)    # => Some random number between 5 
# and 15.
p random_score(5, 5) # => Some random number between 5 
# and 10


# Named parameters


# These are all the same:
p random_score(5, 5)
p random_score(5, max: 5)
p random_score(base: 5, max: 5)
p random_score(max: 5, base: 5)



When writing applications, code needs to be structured in such a way that it can be reused, documented, and tested. The base of this structure is creating methods. In the next chapter, we will expand to object-oriented programming with classes and modules. A method has a name, can receive parameters, and always returns a value (nil is also a value). See this, for example:

def leap_year?(year)
  divides_by_4 = (year % 4 == 0)
  divides_by_100 = (year % 100 == 0)
  divides_by_400 = (year % 400 == 0)
  divides_by_4 && !(divides_by_100 && !divides_by_400)
end
puts leap_year? 1900 # => false
puts leap_year? 2000 # => true
puts leap_year? 2020 # => true

Copy
Method definitions start with the def keyword followed by the method name. In this case, the method name is leap_year?, including the interrogation symbol. Then, if the method has parameters, they will come between parentheses. A method will always return the result of its last line, in this example, the conditional result. Types don't need to be specified explicitly and will be deduced from usage.

When calling a method, the parentheses around the arguments are optional and are frequently omitted for legibility. In this example, puts is a method just like leap_year? and its argument is the result of the latter. puts leap_year? 1900 is the same as puts(leap_year?(1900)).

Method names are like variables and follow the convention of using only lower-case letters, numbers, and underscores. Additionally, method names can end in interrogation or exclamation mark symbols. These don't have a special meaning in the language but are usually applied according to this convention:

A method ending in ? may indicate that the method is checking for some condition and will return a Bool value. It is also commonly used for methods that return a union of some type and Nil to indicate a failure condition.
A method ending in ! indicates that the operation it performs is "dangerous" somehow and the programmer must be careful when using it. Sometimes a "safer" variant of the method might exist with the same name, without the ! symbol.
Methods can build upon other methods. See this, for example:

def day_count(year)
  leap_year?(year) ? 366 : 365
end

Copy
Methods can be overloaded by the number of arguments. See this, for example:

def day_count(year, month)
  case month
  when 1, 3, 5, 7, 8, 10, 12
    31
  when 2
    leap_year?(year) ? 29 : 28
  else
    30
  end
end

Copy
In this case, the method will be selected depending on how you arrange the arguments to call it:

puts day_count(2020)    # => 366
puts day_count(2021)    # => 365
puts day_count(2020, 2) # => 29

Copy
Inside methods, the return keyword can be used to exit the method execution early, optionally delivering a value to the method's caller. The last expression in a method body behaves as an implicit return. It is mostly used inside conditionals for exceptional paths. See this, for example:

def day_count(year, month)
  if month == 2
    return leap_year?(year) ? 29 : 28
  end
  month.in?(1, 3, 5, 7, 8, 10, 12) ? 31 : 30
end

Copy
As types can be omitted when declaring a method, the parameter types are determined when the method is called. See this, for example:

def add(a, b) # 'a' and 'b' could be anything.
  a + b
end
p add(1, 2)            # Here they are Int32, prints 3.
p add("Crys", "tal")   # Here they are String, prints 
  # "Crystal".
# Let's try to cause issues: 'a' is Int32 and 'b' is 
  # String.
p add(3, "hi")
    # => Error: no overload matches 'Int32#+' with type 
      # String

Copy
Every time the method is called with a different type, a specialized version of it is generated. In this example, the same method can be used to add numbers and to concatenate strings. It can't be confused with dynamic typing: the a parameter has a well-known type in each variation of the method.

In the third call, it tries to call add with Int32 and String. Again, a new specialized version of add is generated for those types, but now it will fail because a + b doesn't make sense when mixing numbers and text.

Not specifying types allows for the duck typing pattern. It is said that if it walks like a duck and it quacks like a duck, then it must be a duck. In this context, if the types passed as arguments support the a + b expression, then they will be allowed because this is all the implementation cares about, even if they are of a type never seen before. This pattern can be helpful to provide more generic algorithms and support unexpected use cases.

Adding type restrictions
Not having types isn't always the best option. Here are a few of the advantages of specifying types:

A method signature with types is easier to understand, especially in the documentation.
Overloads with different implementations can be added for different types.
When you make a mistake and call some method with the wrong type, the error message will be cleaner when the parameters are typed.
Crystal has special semantics for specifying types: it's possible to restrict what types a parameter can receive. When the method is called, the compiler will check whether the argument type respects the parameter type restriction. If it does, then a specialized version of the method will be generated for that type. Here are some examples:

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

Copy
A parameter can be restricted to a type by writing it after a colon symbol. Note that a space character before and after the colon is required. Types will be checked whenever the method is called to ensure correctness. If an attempt is made to call a method with an invalid type, it will be detected at compile time, giving a proper error message.

In this example, you also see the Int type. It is a union of all integer types and is particularly useful in restrictions. You can also use other unions as well.

The last line shows the concept of multi-dispatch in Crystal: if a call argument is a union type (Int32 | String in this case) and the method has multiple overloads, the compiler will generate code to check the actual type at runtime and pick the correct method implementation.

Multi-dispatch will also happen in a type hierarchy, if the argument expression is of an abstract parent type and there is a method defined for each possible concrete type. You will learn more about defining type hierarchies in the next chapter.

A type restriction is similar to type annotations in most other languages, where you specify the actual type of the parameter. But Crystal doesn't have type annotations. The word "restriction" is important here: a type restriction serves to restrict which possible types are acceptable. The actual type still comes from the call site. See this, for example:

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

Copy
It's interesting to see that the method body is always specialized to the types used at the call site without requiring runtime checks or any dynamism. This is part of what makes Crystal a very fast language.

You can also apply type restrictions to the return type of a method; this will ensure that the method is behaving as expected and producing the correct data. See this, for example:

def add(a, b) : Int
  a + b
end
add 1, 3     # => 4
add "a", "b" # Error: method top-level add must return Int 
  # but it is returning String

Copy
Here the string variation will fail to compile because a + b will produce String, but the method is restricted to return Int. Besides a type, parameters can also have default values.

Default values
Methods can have default values to their arguments; this is a way of marking them as optional. To do so, specify a value after the parameter name, using the equals symbol. See this, for example:

def random_score(base, max = 10)
  base + rand(0..max)
end
p random_score(5)    # => Some random number between 5 
  # and 15.
p random_score(5, 5) # => Some random number between 5 
  # and 10.

Copy
You can use a default value when the method has a most common value, but you still want to allow different values to be passed if necessary. If there are many parameters with default values, it becomes a good practice to name them.

Named parameters
When a method is called with many arguments, it can sometimes be confusing as to what each one means. To improve on this, parameters can be named at the call site. Here is an example:

# These are all the same:
p random_score(5, 5)
p random_score(5, max: 5)
p random_score(base: 5, max: 5)
p random_score(max: 5, base: 5)

Copy
All four calls do the same thing, but the more verbose the call is, the easier it becomes to reason about what each 5 means. Additionally, you can reorder the arguments when using named parameters.

In some cases, it makes sense to force some parameters to always be named. For example, let's say we have a method that returns the opening time of a store. It needs to know if the day is a holiday and if it is part of the weekend:

def store_opening_time(is_weekend, is_holiday)
  if is_holiday
    is_weekend ? nil : "8:00"
  else
    is_weekend ? "12:00" : "9:00"
  end
end

Copy
There's nothing unusual with this implementation. But if you start to use it, it becomes very confusing quickly:

p store_opening_time(true, false) # What is 'true' and 
  # 'false' here?



# To force some parameters to be named, add an * symbol before them. Everything to the left of the * will be positional parameters, and everything to the right will always be named parameters. They can also have default values:



def store_opening_time(*, is_weekend, is_holiday)
  # ...
end
p store_opening_time(is_weekend: true, is_holiday: false)
p store_opening_time(is_weekend: true, is_holiday: false)
p store_opening_time(true, false) # Invalid!


def multiply(value, *, by factor, adding term = 0)
  value * factor + term
end
p multiply(3, by: 5)             # => 15
p multiply(2, by: 3, adding: 10) # => 16