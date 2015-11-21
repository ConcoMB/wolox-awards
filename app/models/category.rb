class Category < ActiveRecord::Base

  has_many :nominees
  has_many :voters
  mount_uploader :avatar, PictureUploader
  after_create :init

  def init
    return unless is_open
    User.all.each { |u| Nominee.create(user: u, category: self) }
  end
end
