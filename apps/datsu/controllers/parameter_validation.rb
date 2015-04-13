require_relative '../error_serializers/lotus_validations_errors'

module ParameterValidation
  private
  def validate!
    halt_with_errors unless params.valid?
  end

  def halt_with_errors
    halt 422, ErrorSerializers::LotusValidationsErrors.new(errors).to_json
  end
end
