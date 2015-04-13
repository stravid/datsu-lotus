module TransactionalDatabaseTestRuns
  def run(*args, &block)
    result = nil
    Sequel::Model.db.transaction(rollback: :always, auto_savepoint: true) { result = super }
    result
  end
end
