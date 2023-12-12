class Chat < ApplicationRecord
  scope :latest_messages, ->(limit) { order(created_at: :desc).limit(limit) }
end
