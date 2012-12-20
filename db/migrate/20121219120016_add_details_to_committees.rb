class AddDetailsToCommittees < ActiveRecord::Migration
  def change
    add_column :committees, :address, :text
    add_column :committees, :contact_info, :text
  end
end
