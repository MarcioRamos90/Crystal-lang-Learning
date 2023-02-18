class Holder(T)
    def initialize(@value : T)
    end
    def get
        @value
    end
    def set=(new_value : T)
        @value = new_value
    end
end

num = Holder(Int32).new(10)
num.set = 40
p num.get # Prints 40.


str = Holder.new("Hello")
p str.get # Prints "Hello".