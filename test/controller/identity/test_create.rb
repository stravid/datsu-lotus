require 'test_helper'
require_relative '../../../apps/datsu/controllers/identities/create'

class TestControllerIdentitiesCreate < UnitTest
  def setup
    @action = Datsu::Controllers::Identities::Create.new
  end

  def test_email_parameter_is_required
    @action.call({ identity: { email: nil }})
    assert @action.errors.for('identity.email').map(&:validation).include?(:presence)
  end

  def test_password_parameter_is_required
    @action.call({ identity: { password: nil }})
    assert @action.errors.for('identity.password').map(&:validation).include?(:presence)
  end
end
