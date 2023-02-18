require "./factorial"
(1..10).each do |i|
  puts "#{i}! = #{factorial(i)}"
end