require 'bcrypt'

module Datsu
  module Model
    class Identity
      include Lotus::Entity

      attributes :email, :password_digest, :password

      def password=(password)
        self.password_digest = BCrypt::Password.create(password)
      end
    end
  end
end
