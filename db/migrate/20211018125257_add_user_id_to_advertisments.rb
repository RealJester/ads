class AddUserIdToAdvertisments < ActiveRecord::Migration[6.1]
  def change
    add_reference :advertisments, :user, null: false, foreign_key: true
  end
end
