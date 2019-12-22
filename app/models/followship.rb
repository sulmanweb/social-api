class Followship < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :followee, class_name: 'User'

  validates :follower_id, presence: true
  validates :followee_id, presence: true
  validates :follower_id, uniqueness: {scope: :followee_id}
  validate :user_not_follower_followee

  before_validation :set_status_true, on: :create

  def user_not_follower_followee
    if follower_id == followee_id
      errors.add(:base, message: I18n.t('errors.models.followships.same_user'))
    end
  end

  def set_status_true
    status = true
  end
end
