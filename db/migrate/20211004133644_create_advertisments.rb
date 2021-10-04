class CreateAdvertisments < ActiveRecord::Migration[6.1]
  def change
    create_table :advertisments do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
