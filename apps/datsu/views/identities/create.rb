require 'json'

module Datsu::Views::Identities
  class Create
    include Datsu::View

    format :json

    def render
      _raw JSON.generate identity
    end
  end
end
