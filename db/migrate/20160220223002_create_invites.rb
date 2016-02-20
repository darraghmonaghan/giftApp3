class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.string :email
      t.integer :sender_id
      t.integer :recipient_id
      t.string :token
      t.integer :group_id

      t.timestamps null: false
    end
  end
end
