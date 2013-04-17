class CreateRainchecks < ActiveRecord::Migration
  def change
    create_table :rainchecks do |t|
      t.string :title
      t.references :user
      t.string :description
      t.boolean :completed

      t.timestamps
    end
    add_index :rainchecks, :user_id
  end
end
