struct Address
    property state : String, city : String
    property line1 : String, line2 : String
    property zip : String
    def initialize(@state, @city, @line1, @line2, @zip)
    end
end

class Person
    property address : Address?
end

address = Address.new("CA", "Los Angeles", "Some ficticius line", "First house", "1234")
p1 = Person.new
p2 = Person.new
p1.address = address
address.zip = "ABCD"
p2.address = address
puts p1.address.try &.zip
puts p2.address.try &.zip


# Iliding the copy
struct Location
    property latitude = 0.0, longitude = 0.0
end
class Building
    property gps = Location.new
end
building = Building.new
building.gps.latitude = 1.5
p building