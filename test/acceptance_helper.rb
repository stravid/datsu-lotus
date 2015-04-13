require 'test_helper'
require 'rack/test'
require 'support/transactional_database_test_runs'

class AcceptanceTest < MiniTest::Test
  include Rack::Test::Methods
  include TransactionalDatabaseTestRuns

  def app
    @app ||= Lotus::Container.new
  end

  def response
    last_response
  end

  def request
    last_request
  end

  def body
    JSON.parse(response.body)
  end
end

