class AddIntexToUsersEmail < ActiveRecord::Migration
  def change
    # add index to email to keep uniqueness in database
    # (not only in validation)
    add_index :users, :email, unique: true
  end
end
