class User < ApplicationRecord
  validates :line_user_id, presence: true, uniqueness: true
  has_many :acts, dependent: :destroy
  has_many :comments
  has_many :entries
  has_many :direct_messages
  has_many :rooms, through: :entries

  def own?(object)
    id == object.user_id
  end
end
