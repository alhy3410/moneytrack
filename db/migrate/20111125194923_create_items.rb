class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :category_id
      t.integer :entry_id
      t.string :comment

      t.timestamps
    end
  end
end
