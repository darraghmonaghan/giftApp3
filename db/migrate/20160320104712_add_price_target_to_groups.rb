class AddPriceTargetToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :target, :integer
    add_column :groups, :current, :integer
  end
end
