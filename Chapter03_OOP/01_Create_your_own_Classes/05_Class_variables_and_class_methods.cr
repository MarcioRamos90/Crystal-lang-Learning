class Person
    @@next_id = 1
    @id : Int32
    def initialize(@name : String)
        @id = @@next_id
        @@next_id += 1
    end
    def self.reset_next_id
        @@next_id = 1
    end
    def self.increase_next_id=(value)
        @@next_id += value
    end

    # class_property next_id # it's possible too
end

first = Person.new("Adam") # id == 1
p first

Person.increase_next_id = 12

second = Person.new("Jess") # id == 2
p second

Person.reset_next_id

third = Person.new("Monica") # id ==1
p third

