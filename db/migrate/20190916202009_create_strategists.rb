class CreateStrategists < ActiveRecord::Migration[5.2]
  def change
    create_table :strategists do |t|
      t.string :name
      t.string :location

      t.timestamps
    end
  end
end
