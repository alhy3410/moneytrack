class UpdateItems < ActiveRecord::Migration
  def change
    add_column :items, :amount, :float
  end
end
