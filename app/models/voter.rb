class Voter < ActiveRecord::Base

  belongs_to :category
  belongs_to :user

  validates :category_id, :user_id, presence: true

end
