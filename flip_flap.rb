require_relative 'tsv_buddy'
require 'yaml'

# Class converts data to yaml
class FlipFlap
  include TsvBuddy

  # Do not create any initializers

  def take_yaml(yaml)
    @data = YAML.load(yaml)
  end

  def to_yaml
    @data.to_yaml
  end
end
