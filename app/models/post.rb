class Post < ApplicationRecord
  ## ENTITIES
  belongs_to :user

  ## RELATIONSHIPS
  validates :content, presence: true
  validates :status, inclusion: {in: [true, false]}

end
