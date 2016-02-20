class AddDateToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :date, :datetime
  end
end
