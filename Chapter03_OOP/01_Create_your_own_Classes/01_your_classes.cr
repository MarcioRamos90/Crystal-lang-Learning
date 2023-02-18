class Person
    def initialize(name : String)
        @name = name
        @age = 0
    end
    def age_up
        @age += 1
    end
    def name
        @name
    end
    def name=(new_name)
        @name = new_name
    end
end

# person1 = Person.new
# person2 = Person.new

# p person1

# p person1.to_s # transform object to string
# p person1 == person2 # false. By default, compares by reference
# p person1.same?(person2) # false, same as above
# p person1.nil? # false, person1 isn't nil.
# p person1.is_a?(Person) # true, person1 is an instance of Person.

class Person
    def age
        @age
    end
end

jane = Person.new("Jane Doe")
p jane
jane.name = "Mary"
5.times { jane.age_up }
p jane
p jane.name
p jane.age

# class PersonInvalid
#     def initialize(first_name, last_name) 
#         @name= first_name + " " + last_name
#     end 
# end
# person = PersonInvalid.new("John", "Doe")
