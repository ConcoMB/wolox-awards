class AddRandomToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :random, :boolean
  end
end
