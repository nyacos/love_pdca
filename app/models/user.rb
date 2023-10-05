class User < ApplicationRecord
  validates :line_user_id, presence: true, uniqueness: true
  has_many :acts, dependent: :destroy

  def own?(object)
    id == object.user_id
  end
end
