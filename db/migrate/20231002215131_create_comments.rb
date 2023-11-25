class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments, if_not_exists: true do |t|
      t.references :user, foreign_key: true
      t.references :act, foreign_key: true
      t.string :body ,null: false

      t.timestamps
    end
  end
end
