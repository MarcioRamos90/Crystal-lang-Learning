def perform_operation
    puts "before yield"
    yield
    puts "between yields"
    yield
    puts "after both yields"
end
perform_operation {
  puts "inside block"
}
p ""
perform_operation do
  puts "inside block"
end



p ""
p ""
def transform(list)
  i = 0
  # new_list is an Array made of whatever type the block 
    # returns
  new_list = [] of typeof(yield list[0])
  while i < list.size
    new_list << yield list[i]
    i += 1
  end
  new_list
end
numbers = [1, 2, 3, 4, 5] 
p transform(numbers) { |n| n ** 2 } # => [1, 4, 9, 16, 25]
p (
  transform(numbers) do |n| 
    n.to_s 
  end
) # => ["1", "2", "3", "4", "5"]



p ""
p ""
def generate
  first = yield 1    # This will be 2
  second = yield 2   # This will be 10
  third = yield 3    # This will be 4
  first + second + third
end
result = generate do |x|
  if x == 2
    next 10
  end
  x + 1
end
p result



p ""
p ""
def collatz_sequence(n)
  while true
    n = if n.even?
      n // 2
    else
      3 * n + 1
    end
    yield n
  end
end
def sequence_length(initial)
  length = 0
  collatz_sequence(initial) do |x|
    puts "Element: #{x}"
    length += 1
    if x == 1
      return length      # <= Note this 'return'
    end
  end
end
puts "Length starting from 14 is: #{sequence_length(14)}"