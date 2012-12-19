class CreateCommitteeTypes < ActiveRecord::Migration
  def change
    create_table :committee_types do |t|
      t.string :title

      t.timestamps
    end
  end
end
