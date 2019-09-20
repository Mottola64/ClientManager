class CreateDeliverables < ActiveRecord::Migration[5.2]
  def change
    create_table :deliverables do |t|
      t.string :type
      t.string :description
      t.datetime :date_assigned
      t.datetime :due_date
      t.string :account_id

      t.timestamps
    end
  end
end
