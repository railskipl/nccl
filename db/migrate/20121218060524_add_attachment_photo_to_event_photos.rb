class AddAttachmentPhotoToEventPhotos < ActiveRecord::Migration
  def self.up
    change_table :event_photos do |t|
      t.has_attached_file :photo
    end
  end

  def self.down
    drop_attached_file :event_photos, :photo
  end
end
