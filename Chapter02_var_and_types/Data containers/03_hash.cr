population = {
  "China"         => 1_439_323_776,
  "India"         => 1_380_004_385,
  "United States" => 331_002_651,
  "Indonesia"     => 273_523_615,
  "Pakistan"      => 220_892_340,
  "Brazil"        => 212_559_417,
  "Nigeria"       => 206_139_589,
  "Bangladesh"    => 164_689_383,
  "Russia"        => 145_934_462,
  "Mexico"        => 128_932_753,
} of String => Int64

p typeof (population)

# population = {} of String => Int32 # to declare empty Hash

p "Total population: #{population.values.sum}"

# puts "Total population: #{population.values.sum(0_i64)}" # to arithmetic overflow error
