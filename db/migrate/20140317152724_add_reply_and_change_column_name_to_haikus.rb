class AddReplyAndChangeColumnNameToHaikus < ActiveRecord::Migration
  def change
    rename_column :haikus, :last_five, :second_five
    rename_column :haikus, :middle_seven, :first_seven
    add_column :haikus, :in_reply_to_haiku_id, :integer
    add_column :haikus, :second_seven, :string
    add_column :haikus, :last_part, :boolean, default: false
  end
end
