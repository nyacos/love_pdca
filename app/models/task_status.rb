class TaskStatus < ApplicationRecord
  belongs_to :task
  belongs_to :user

  enum status: { todo: 0, done: 1 }
end
