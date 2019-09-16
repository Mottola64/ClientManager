class CreateDeliverables < ActiveRecord::Migration[5.2]
  def change
    create_table :deliverables do |t|
      t.string :name

      t.timestamps
    end
  end
end
