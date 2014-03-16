class CreateStyles < ActiveRecord::Migration
  def change
    create_table :styles do |t|
      t.string :color

      t.timestamps
    end
  end
end
