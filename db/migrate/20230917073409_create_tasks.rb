class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks, if_not_exists: true do |t|
      t.string :title
      t.string :content
      t.integer :category_id
      # t.references :category

      t.timestamps
    end
  end
end
