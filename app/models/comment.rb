class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :act

  validates :body, presence: true
end
