class CreateIncomes < ActiveRecord::Migration[7.0]
  def change
    create_table :incomes do |t|
      t.string :name
      t.string :txdate
      t.string :description
      t.integer :amount

      t.timestamps
    end
  end
end
