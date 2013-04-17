class CreateRaincheckUsers < ActiveRecord::Migration
  def change
    create_table :raincheck_users do |t|
      t.references :user
      t.references :raincheck
      t.boolean :given

      t.timestamps
    end
    add_index :raincheck_users, :user_id
    add_index :raincheck_users, :raincheck_id
  end
end
