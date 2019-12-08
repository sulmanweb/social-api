class Session < ApplicationRecord
  ## RELATIONSHIPS
  belongs_to :user

  ## VALIDATIONS
  validates :token, presence: true, uniqueness: true
  validates :status, acceptance: true

  ## SCOPES
  scope :active, -> { where status: true }

  ## CALLBACKS
  before_validation :generate_token, on: :create

  ## QUESTIONS
  def self.find_token(token)
    find_by(status: true, token: token)
  end

  ## SETTERS
  # deactivate the session
  def deactivate!
    update(status: false)
  end

  private

  def generate_token
    self.status = true
    self.token = loop do
      random_token = SecureRandom.base58(SESSION_TOKEN_LENGTH)
      break random_token unless Session.exists?(token: random_token)
    end
  end
end
