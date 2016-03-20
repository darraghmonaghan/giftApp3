class ChangeDonationFormatsFromDecimalToInteger2 < ActiveRecord::Migration

  def up
    change_column :groups, :target, :integer
    change_column :groups, :current, :integer  
  end

  def down
    change_column :groups, :current, :decimal
    change_column :groups, :target, :decimal
  end


end
