class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :expense_type
      t.float :amount
      t.references :application, index: true

      t.timestamps null: false
    end
  end
end
