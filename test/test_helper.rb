# Require this file for unit tests
ENV['LOTUS_ENV'] ||= 'test'

require_relative '../config/environment'
require 'minitest/autorun'
require 'minitest/hell'
require 'minitest/unit'
require 'bogus/minitest'
require 'support/assertions'
require 'support/transactional_database_test_runs'

Lotus::Application.preload!

class UnitTest < MiniTest::Test
  include TransactionalDatabaseTestRuns
end
