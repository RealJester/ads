class AddStateToAdvertisments < ActiveRecord::Migration[6.1]
  def change
    add_column :advertisments, :state, :string, default: "drafted"
    add_index :advertisments, :state
  end
end
