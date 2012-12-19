class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.text :desc
      t.string :meta_title
      t.string :meta_key
      t.string :meta_desc

      t.timestamps
    end
  end
end
