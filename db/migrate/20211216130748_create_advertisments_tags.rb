class CreateAdvertismentsTags < ActiveRecord::Migration[6.1]
  def change
    create_table :advertisments_tags do |t|
      t.belongs_to :advertisments, null: false, foreign_key: true
      t.belongs_to :tags, null: false, foreign_key: true

      t.timestamps
    end
  end
end
