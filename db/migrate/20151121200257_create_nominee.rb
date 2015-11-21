class CreateNominee < ActiveRecord::Migration
  def change
    create_table :nominees do |t|
      t.references :category
      t.references :user
    end
  end
end
