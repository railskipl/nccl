class CreateEventPhotos < ActiveRecord::Migration
  def change
    create_table :event_photos do |t|
      t.integer :event_id
      t.string :tag_name

      t.timestamps
    end
  end
end
