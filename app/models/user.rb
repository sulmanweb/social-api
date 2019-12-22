class User < ApplicationRecord
  ## ENTITIES
  has_secure_password

  ## RELATIONSHIPS
  has_many :sessions, dependent: :destroy
  has_many :posts, dependent: :destroy
  # A follower is a user than follows another user.
  has_many :follower_followships,
           class_name: "Followship",
           foreign_key: "follower_id",
           dependent: :destroy
  # We reference the users that the user follows through the join
  # table.
  has_many :followees, through: :follower_followships
  # A followee is a user that is followed by another user.
  has_many :followee_followships,
           class_name: "Followship",
           foreign_key: "followee_id",
           dependent: :destroy
  # To see the users that follow a user, we reference them through the join
  # table.
  has_many :followers, through: :followee_followships

  ## VALIDATIONS
  validates :username, presence: true, uniqueness: true, length: {in: 5..20}, format: {with: /\A[a-z0-9]+(?:[_-]?[a-z0-9])*\z/, message: "errors.models.user.username_format"}
  validates :email, presence: true, uniqueness: true, format: {with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: I18n.t("errors.models.user.email_format")}
  validates :password, format: {with: /\A(?=.*[a-zA-Z])(?=.*[0-9]).{8,72}\z/, message: I18n.t("errors.models.user.password_format")}, if: lambda { password_digest.nil? || !password.blank? }
  validates :first_name, format: {with: /\A[a-z]+\z/i, message: I18n.t("errors.models.user.only_alphabets")}, allow_blank: true, allow_nil: true
  validates :last_name, format: {with: /\A[a-z]+\z/i, message: I18n.t("errors.models.user.only_alphabets")}, allow_blank: true, allow_nil: true

  ## CALLBACKS
  before_validation :downcase_email!

  ## METHODS
  def follow(user)
    followees << user
  end

  def unfollow(followed_user)
    followees.delete followed_user
  end

  ## QUESTIONS

  def name
    if first_name.present? && last_name.present?
      first_name + ' ' + last_name
    else
      nil
    end
  end

  private

  # downcase email
  def downcase_email!
    email&.downcase!
  end
end
