class AddAttachmentPhotoToCommittees < ActiveRecord::Migration
  def self.up
    change_table :committees do |t|
      t.has_attached_file :photo
    end
  end

  def self.down
    drop_attached_file :committees, :photo
  end
end
