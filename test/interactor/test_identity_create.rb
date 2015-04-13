require 'test_helper'

class TestIdentityCreateInteractor < UnitTest
  def test_created_identity_is_returned
    result = Interactors::Identity::Create.call({ email: 'test@test.test', password: 'secret' })
    assert_equal IdentityRepository.find(result.identity.id), result.identity
  end

  def test_error_is_raised_when_email_is_already_taken
    Interactors::Identity::Create.call({ email: 'test@test.test', password: 'secret' })

    assert_raises(Interactors::Identity::Create::EmailAlreadyInUse) { Interactors::Identity::Create.call({ email: 'test@test.test', password: 'secret' }) }
  end
end
