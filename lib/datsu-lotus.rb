require 'lotus/model'
Dir["#{ __dir__ }/datsu-lotus/**/*.rb"].each { |file| require_relative file }

Lotus::Model.configure do
  # Database adapter
  #
  # Available options:
  #
  #  * Memory adapter
  #    adapter type: :memory, uri: 'memory://localhost/datsu-lotus_development'
  #
  #  * SQL adapter
  #    adapter type: :sql, uri: 'sqlite://db/datsu-lotus_development.sqlite3'
  #    adapter type: :sql, uri: 'postgres://localhost/datsu-lotus_development'
  #    adapter type: :sql, uri: 'mysql://localhost/datsu-lotus_development'
  #
  adapter type: :sql, uri: ENV['DATSU_LOTUS_DATABASE_URL']

  ##
  # Database mapping
  #
  # Intended for specifying application wide mappings.
  #
  # You can specify mapping file to load with:
  #
  # mapping "#{__dir__}/config/mapping"
  #
  # Alternatively, you can use a block syntax like the following:
  #
  mapping do
    # collection :users do
    #   entity     User
    #   repository UserRepository
    #
    #   attribute :id,   Integer
    #   attribute :name, String
    # end

    collection :identities do
      entity Identity

      attribute :id,   Integer
      attribute :email, String
      attribute :password_digest,  String
    end
  end
end.load!
