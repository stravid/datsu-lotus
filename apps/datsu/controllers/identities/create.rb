module Datsu::Controllers::Identities
  class Create
    include Datsu::Action

    def call(params)
      self.body = '111'
    end
  end
end
