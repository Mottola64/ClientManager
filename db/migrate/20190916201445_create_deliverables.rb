class CreateDeliverables < ActiveRecord::Migration[5.2]
  def change
    create_table :deliverables do |t|
      t.belongs_to :account, foreign_key: true
      t.string :report_type
      t.string :description
      t.datetime :date_assigned
      t.datetime :due_date

      t.timestamps
    end
  end
end
