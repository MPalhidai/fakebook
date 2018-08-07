class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar

  def profile_pic
    return self.avatar.variant(resize: '300x300!').processed
  end
end
