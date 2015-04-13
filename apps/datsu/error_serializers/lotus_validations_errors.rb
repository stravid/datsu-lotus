require 'json'

module ErrorSerializers
  class LotusValidationsErrors
    def initialize(errors)
      @errors = errors
    end

    def to_json
      JSON.generate({ errors: errors_hash })
    end

    private
    def errors_hash
      @errors_hash ||= @errors.to_h.inject({}) { |hash, (key, value)| hash.merge({ value.first.attribute_name.to_sym => value.map(&:validation) }) }.to_h
    end
  end

  class Hash
    def initialize(errors)
      @errors = errors
    end

    def to_json
      JSON.generate({ errors: @errors })
    end
  end
end
