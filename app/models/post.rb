class Post < ApplicationRecord
  ## ENTITIES
  belongs_to :user

  ## RELATIONSHIPS
  validates :content, presence: true
  validates :status, inclusion: {in: [true, false]}

  ## CALLBACKS
  before_validation :set_status

  ## METHODS
  def set_status
    status = true
  end
end
