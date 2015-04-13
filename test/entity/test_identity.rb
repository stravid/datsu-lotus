require 'test_helper'
require_relative '../../lib/datsu-lotus/entities/identity'

class TestIdentity < UnitTest
  def test_bcrypt_password_digest_is_set_by_password_setter
    identity = Identity.new password: 'secret'

    assert BCrypt::Password.new(identity.password_digest) == 'secret'
  end
end
