class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, if_not_exists: true do |t|
      t.string :line_user_id, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
