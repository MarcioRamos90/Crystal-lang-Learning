require "yaml"
require "json"

module Transform::YAML
  def self.deserialize(input : String) : String
    p "des #{input}"
    ::YAML.parse(input).to_json
  end

  def self.serialize(input : String) : String
    p "ses #{input}"
    JSON.parse(input).to_yaml
  end
end
