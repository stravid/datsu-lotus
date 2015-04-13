module Minitest::Assertions
  def assert_json_schema(schema, json)
    schema_directory = "#{Dir.pwd}/test/support/schemas"
    schema_path = "#{schema_directory}/#{schema.to_s}.json"

    assert JSON::Validator.validate!(schema_path, json, strict: true)
  end
end
