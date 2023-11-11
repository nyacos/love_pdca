class CreateActs < ActiveRecord::Migration[7.0]
  def change
    create_table :acts, if_not_exists: true do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false
      t.string :body, null: false

      t.timestamps
    end
  end
end
