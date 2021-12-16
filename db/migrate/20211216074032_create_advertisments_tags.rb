class CreateAdvertismentsTags < ActiveRecord::Migration[6.1]
  def change
    create_table :advertisments_tags do |t|
      t.belongs_to :tag, null: false, foreign_key: true
      t.belongs_to :advertisment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
