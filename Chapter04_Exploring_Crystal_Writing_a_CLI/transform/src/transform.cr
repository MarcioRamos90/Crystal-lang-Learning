require "./yaml"
require "./processor"

module Transform
  VERSION = "0.1.0"

  # INPUT_DATA = %([{"id": 1, "author":{"name": "Jim"}}, {"id":2, "author":{"name":"Bob"}}])

  INPUT_DATA = <<-YAML
  ---
  - id: 1
    author:
      name: Jim
  - id: 2
    author:
      name: Bob
  YAML

  puts Transform::Processor.new.process INPUT_DATA
end
