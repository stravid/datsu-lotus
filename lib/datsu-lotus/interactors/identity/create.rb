require_relative '../interactor'

module Interactors::Identity
  class Create
    extend Interactor

    class EmailAlreadyInUse < StandardError; end

    Result = Struct.new(:identity)

    def call(parameters)
      identity = IdentityRepository.create Identity.new(parameters)

      Result.new identity
    rescue Sequel::UniqueConstraintViolation
      raise EmailAlreadyInUse.new parameters[:email]
    end
  end
end
