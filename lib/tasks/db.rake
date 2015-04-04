namespace :db do
  desc 'Run migrations'
  task :migrate => :environment do
    require 'sequel'

    Sequel.extension :migration
    db = Sequel.connect ENV.fetch('DATABASE_URL')

    Sequel::Migrator.run db, 'db/migrations'
  end

  desc 'Rollback last migration'
  task :rollback => :environment do
    require 'sequel'

    Sequel.extension :migration
    db = Sequel.connect ENV.fetch('DATABASE_URL')
    version = db.tables.include?(:schema_info) ? db[:schema_info].first[:version] : 0

    Sequel::Migrator.run db, 'db/migrations', target: version
  end
end
