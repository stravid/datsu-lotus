module Datsu::Controllers::Identities
  class Create
    include Datsu::Action

    expose :identity

    params do
      param :email, presence: true
    end

    def call(params)
      @identity = {
        id: 1,
        email: 'david@strauss.io'
      }
    end
  end
end
