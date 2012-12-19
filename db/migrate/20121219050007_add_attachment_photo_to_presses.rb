class AddAttachmentPhotoToPresses < ActiveRecord::Migration
  def self.up
    change_table :presses do |t|
      t.has_attached_file :photo
    end
  end

  def self.down
    drop_attached_file :presses, :photo
  end
end
