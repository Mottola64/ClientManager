class AddColumnToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :user_id, :integer
    add_column :accounts, :strategist_id, :integer
  end
end
