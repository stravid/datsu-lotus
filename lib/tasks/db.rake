namespace :db do
  desc 'Run migrations'
  task :migrate => :environment do
    require 'sequel'

    Sequel.extension :migration
    db = Sequel.connect ENV.fetch('DATSU_LOTUS_DATABASE_URL')

    Sequel::Migrator.run db, 'db/migrations'
  end

  desc 'Rollback last migration'
  task :rollback => :environment do
    require 'sequel'

    Sequel.extension :migration
    db = Sequel.connect ENV.fetch('DATSU_LOTUS_DATABASE_URL')
    table_name = :schema_migrations

    if db.tables.include?(table_name) && db[table_name].count > 1
      last_two_migrations = db[table_name].order(:filename).last(2)
      filename = last_two_migrations[1][:filename]
      version = /^(\d{14})\D*/.match(filename).captures[0].to_i
    else
      version = 0
    end

    Sequel::Migrator.run db, 'db/migrations', target: version
  end
end
