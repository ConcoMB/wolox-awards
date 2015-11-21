class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_create :init
  mount_uploader :avatar, PictureUploader

  validates :email, :name, presence: true

  def password_required?
    false
  end

  def init
    return if encrypted_password.present?
    pass = Digest::SHA1.hexdigest(email + Time.current.to_s)
    self.password = pass
    self.password_confirmation = pass
  end

  def can_vote?(category)
    category.is_open || Voter.find_by(user: self, category: category).present?
  end

  def voted?(category)
    Vote.find_by(user: self, category: category).present?
  end

end
