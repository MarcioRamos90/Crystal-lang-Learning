class OddNumberError < Exception
    def initialize(num : Int)
        super("The number #{num} isn't even")
    end
end
def half(num : Int32)
    if num.odd?
        raise OddNumberError.new(num)
    end
    num // 2
end

def half?(num)
    half(num)
rescue error : OddNumberError
    nil
end

p half? 220
p half? 331
p half? 246