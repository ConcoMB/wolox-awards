class CreateVoter < ActiveRecord::Migration
  def change
    create_table :voters do |t|
      t.references :user
      t.references :category
    end
  end
end
