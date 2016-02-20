class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :title
      t.string :description
      t.integer :user_id
      t.time :time

      t.timestamps null: false
    end
  end
end
