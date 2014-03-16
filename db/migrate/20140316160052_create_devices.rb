class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :token
      t.string :type
      t.string :os_version

      t.timestamps
    end
  end
end
