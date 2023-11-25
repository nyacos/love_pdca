class CreateTaskStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :task_statuses, if_not_exists: true do |t|
      t.references :plan, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
