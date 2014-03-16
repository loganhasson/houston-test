class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :token
      t.string :device_type
      t.string :os_version

      t.timestamps
    end
  end
end
