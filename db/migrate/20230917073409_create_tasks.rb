class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :content
      t.references :category

      t.timestamps
    end
  end
end
