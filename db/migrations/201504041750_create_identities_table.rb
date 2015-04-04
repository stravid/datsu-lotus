Sequel.migration do
  change do
    create_table(:identities) do
      primary_key :id
      String :email, null: false
      String :password_digest, null: false

      index :email, unique: true
    end
  end
end
