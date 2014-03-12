class CreateHaikus < ActiveRecord::Migration
  def change
    create_table :haikus do |t|
      t.string :first_five
      t.string :middle_seven
      t.string :last_five
      t.integer :user_id

      t.timestamps
    end
    add_index :haikus, [:user_id, :created_at]
  end
end
