class CreateCommittees < ActiveRecord::Migration
  def change
    create_table :committees do |t|
      t.string :name
      t.string :education
      t.string :designation
      t.text :description

      t.timestamps
    end
  end
end
