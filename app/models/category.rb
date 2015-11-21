class Category < ActiveRecord::Base

  has_many :nominees
  has_many :voters
  mount_uploader :avatar, PictureUploader

end
