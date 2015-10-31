class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :category_id
      t.string :name

      t.timestamps
    end
  end
end
