class CreateAdminUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :admin_users, if_not_exists: true do |t|
      t.string :email
      t.string :password_digest
      t.boolean :is_admin

      t.timestamps
    end
  end
end
