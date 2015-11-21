class CategoryCreate < ActiveRecord::Migration
  def change
    create_table(:categories) do |t|
      t.string :name
      t.string :avatar
      t.text :description
      t.boolean :is_open
    end
  end
end
