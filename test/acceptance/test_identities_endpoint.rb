require 'acceptance_helper'

class TestIdentitiesEndpoint < AcceptanceTest
  def test_created_identity_is_returned
    post '/identities', { identity: { email: 'test@test.test', password: 'secret' } }

    assert_json_schema :create_identity, body
  end

  def test_email_duplication_error_is_returned
    IdentityRepository.persist Identity.new(email: 'test@test.test', password: 'secret')
    post '/identities', { identity: { email: 'test@test.test', password: 'secret' } }

    expected_body = { "errors" => { "email" => ["uniqueness"] } }

    assert_equal expected_body, body
  end
end
