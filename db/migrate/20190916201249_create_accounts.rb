class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.belongs_to :user, foreign_key: true
      t.string :name
      t.string :tier
      t.integer :acv
      t.string :industry
      t.string :strategist

      t.timestamps
    end
  end
end
