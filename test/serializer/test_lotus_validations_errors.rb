require 'test_helper'
require_relative '../../apps/datsu/error_serializers/lotus_validations_errors'
require 'lotus/validations'
require 'json'

class TestLotusValidationsErrors < UnitTest
  class DummyClass
    include Lotus::Validations

    attribute :attribute_a, format: /^\w{1}$/, exclusion: ['test']
    attribute :attribute_b do
      attribute :attribute_c, presence: true
    end
  end

  def setup
    @dummy_a = DummyClass.new attribute_b: { attribute_c: true }, attribute_a: 'test'
    @dummy_b = DummyClass.new
  end

  def test_serializes_errors
    @dummy_a.valid?

    expected_json = JSON.generate({ errors: { attribute_a: [:format, :exclusion] } })
    actual_json = ErrorSerializers::LotusValidationsErrors.new(@dummy_a.errors).to_json

    assert_equal expected_json, actual_json
  end

  def test_serializes_errors_of_nested_attributes
    @dummy_b.valid?

    expected_json = JSON.generate({ errors: { attribute_c: [:presence] } })
    actual_json = ErrorSerializers::LotusValidationsErrors.new(@dummy_b.errors).to_json

    assert_equal expected_json, actual_json
  end
end
