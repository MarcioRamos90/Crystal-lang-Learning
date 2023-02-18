# A method ending in ? may indicate that the method is checking for some condition and will return a Bool value. It is also commonly used for methods that return a union of some type and Nil to indicate a failure condition.
# A method ending in ! indicates that the operation it performs is "dangerous" somehow and the programmer must be careful when using it. Sometimes a "safer" variant of the method might exist with the same name, without the ! symbol.

def leap_year?(year)
    divides_by_4 = (year % 4 == 0)
    divides_by_100 = (year % 100 == 0)
    divides_by_400 = (year % 400 == 0)
    divides_by_4 && !(divides_by_100 && !divides_by_400)
end
puts leap_year? 1900 # => false
puts leap_year? 2000 # => true
puts leap_year? 2020 # => true


# Methods can build upon other methods. See this, for example:

def day_count(year)
  leap_year?(year) ? 366 : 365
end

# Methods can be overloaded by the number of arguments. See this, for example:

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

  # In this case, the method will be selected depending on how you arrange the arguments to call it:
puts day_count(2020)    # => 366
puts day_count(2021)    # => 365
puts day_count(2020, 2) # => 29

def day_count(year, month)
    if month == 2
      return leap_year?(year) ? 29 : 28
    end
    month.in?(1, 3, 5, 7, 8, 10, 12) ? 31 : 30
end


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