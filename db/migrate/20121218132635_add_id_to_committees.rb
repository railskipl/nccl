class AddIdToCommittees < ActiveRecord::Migration
  def change
    add_column :committees, :committee_type_id, :integer
  end
end
