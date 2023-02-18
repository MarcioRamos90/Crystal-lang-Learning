def half(num : Int)
    if num.odd?
        raise "The number #{num} isn't even"
    end
    num // 2
end

begin
p half 4
p half 5 # Unhandled exception: The number 5 isn't even (Exception)
p half 6 # This won't execute as we have aborted the program. run-time exception
# p half("hello") # compile-time error
rescue error
    puts "can't compute because #{error}!"
end

def half?(num)
    half(num)
rescue
    nil
end

p half? 2 # 1
p half? 3 # nil
p half? 4 # 2

p