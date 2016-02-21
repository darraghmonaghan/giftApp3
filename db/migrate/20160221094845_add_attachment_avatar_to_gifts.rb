class AddAttachmentAvatarToGifts < ActiveRecord::Migration
  def self.up
    change_table :gifts do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :gifts, :avatar
  end
end
