class CreateVote < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user
      t.references :category
      t.references :nominee
    end
  end
end
