require 'json'

module Datsu::Views::Identities
  class Create
    include Datsu::View

    format :json

    def render
      _raw JSON.generate({ identity: { id: identity.id, email: identity.email}})
    end
  end
end
