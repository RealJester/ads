class AddImageToAdvertisments < ActiveRecord::Migration[6.1]
  def change
    add_column :advertisments, :image, :json
  end
end
