class CreateDirectMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :direct_messages, if_not_exists: true do |t|
      t.string :content
      t.references :user, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
