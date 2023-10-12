class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :act, null: false, foreign_key: true
      t.string :body ,null: false

      t.timestamps
    end
  end
end
