module Datsu::Controllers::Identities
  class Create
    include Datsu::Action

    expose :identity

    params do
      param :identity do
        param :email, presence: true
        param :password, presence: true
      end
    end

    def initialize(interactor = Interactors::Identity::Create)
      @interactor = interactor
    end

    def call(params)
      @identity = @interactor.call(params[:identity]).identity
    rescue Interactors::Identity::Create::EmailAlreadyInUse
      halt 422, ErrorSerializers::Hash.new({ email: [:uniqueness] }).to_json
    end
  end
end
