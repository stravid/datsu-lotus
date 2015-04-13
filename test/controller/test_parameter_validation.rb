require 'test_helper'
require_relative '../../apps/datsu/controllers/parameter_validation'
require 'lotus/controller'

class TestParameterValidation < UnitTest
  class DummyAction
    include Lotus::Action
    include ParameterValidation

    params do
      param :a, presence: true
      param :b do
        param :c, presence: true
      end
    end

    def call(params)
      validate!

      self.status = 201
      self.body = 'test'
    end
  end

  FakeParams = Struct.new(:valid?, :errors)

  def setup
    @action = DummyAction.new
    @params = FakeParams.new
  end

  def test_validate_calls_valid
    mock(@params).valid? { true }
    mock(@action).params { @params }

    @action.call({})

    assert_received @params, :valid?, []
  end

  def test_valid_parameters_do_not_stop_execution
    result = @action.call({ a: true, b: { c: true }})

    assert_equal 201, result[0]
    assert_equal 'test', result[2][0]
  end

  def test_invalid_parameters_cause_halt_with_errors
    result = @action.call({})

    assert_equal 422, result[0]
    assert_equal '{"errors":{"a":["presence"],"c":["presence"]}}', result[2][0]
  end
end
