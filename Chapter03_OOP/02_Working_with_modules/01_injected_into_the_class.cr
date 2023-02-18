module WithSayName
    abstract def name : String
    def say_name
        puts "My name is #{name}"
    end
end

class Person
    include WithSayName
    property name : String
    def initialize(@name : String)
    end
end

def show(thing : WithSayName)
    thing.say_name
end

show Person.new("Jim")


# Another way to use module is with other methods

# Prints "Crystal Rocks!":
p Base64.decode_string("Q3J5c3RhbCBSb2NrcyE=")
# Here, Base64 is just a group of related methods to be directly accessed from the module. This is a common pattern that helps you organize methods and classes.