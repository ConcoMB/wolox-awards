class Vote < ActiveRecord::Base

  belongs_to :category
  belongs_to :user
  belongs_to :nominee

  validates :category_id, :user_id, :nominee_id, presence: true
end
