require_relative 'error_serializers'

module ParameterValidation
  private
  def validate!
    halt_with_errors unless params.valid?
  end

  def halt_with_errors
    halt 422, ErrorSerializers::LotusValidations.new(errors).to_json
  end
end
