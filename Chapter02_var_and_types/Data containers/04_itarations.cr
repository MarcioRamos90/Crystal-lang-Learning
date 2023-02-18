require "./03_hash"


p ""
p ""
p "Iterating collections with blocks"

5.times do
    puts "Hello!"
end

(10..15).each do |x|
    puts "My number is #{x}"
end
    
["apple", "orange", "banana"].each do |fruit|
    puts "Don't forget to buy some #{fruit}s!"
end

p ""
p ""
p "Short block syntax"
fruits = ["apple", "orange", "banana"]
# (1) Prints ["APPLE", "ORANGE", "BANANA"]
p(fruits.map do |fruit|
  fruit.upcase
end)
# (2) Same result, braces syntax
p fruits.map { |fruit| fruit.upcase }
# (3) Same result, short block syntax
p fruits.map &.upcase


p ""
p ""
p "Splat parameters"
def get_pop(population, *countries)
    puts "Requested countries: #{countries}"
    countries.map { |country| population[country] }
end

# population = {
#     "China"         => 1_439_323_776,
#     "India"         => 1_380_004_385,
#     "United States" => 331_002_651,
#     "Indonesia"     => 273_523_615,
#     "Pakistan"      => 220_892_340,
#     "Brazil"        => 212_559_417,
#     "Nigeria"       => 206_139_589,
#     "Bangladesh"    => 164_689_383,
#     "Russia"        => 145_934_462,
#     "Mexico"        => 128_932_753,
# } of String => Int64


puts get_pop(population, "Indonesia", "China", "United States")
