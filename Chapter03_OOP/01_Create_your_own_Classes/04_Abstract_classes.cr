abstract class Shape
    abstract def area : Number
end
class Circle < Shape
    def initialize(@radius : Float64)
    end
    def area : Number
        Math::PI * @radius ** 2
    end
end
class Rectangle < Shape
    def initialize(@width : Float64, @height : Float64)
    end
    def area : Number
        @width * @height
    end
end

a = Circle.new(4)
b = Rectangle.new(2,3)
# c = Shape.new # Error: can't instantiate abstract class Shape
