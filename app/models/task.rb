class Task < ApplicationRecord
  has_many :task_statuses
  belongs_to :category
end
