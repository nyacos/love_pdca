class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :act

  validates :body, presence: true, length: { maximum: 65_535 }
end
