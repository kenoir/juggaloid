require 'open-uri'
require 'json'
require 'yaml'
require 'json-schema'

require 'pry'

def write_json(data)
  File.open('simple.json', 'w'){|f| f.write(JSON.pretty_generate(data)) }
end

def validate(schema, data)
  JSON::Validator.validate(schema, data)
end

def run
  yaml   = File.open('simple.yaml').read
  data   = YAML::load(yaml)

  schema = File.open('page_layout_schema.json', "rb"){|f| JSON.parse(f.read)}

  write_json data
  puts (validate schema,data) ? "success" : "failure"
end

run
