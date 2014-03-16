class AddLockedToApplication < ActiveRecord::Migration
  def change
    add_column :applications, :locked, :boolean
  end
end
