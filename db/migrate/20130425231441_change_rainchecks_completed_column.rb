class ChangeRainchecksCompletedColumn < ActiveRecord::Migration

	change_column :rainchecks, :completed, :boolean, :default => false

end
