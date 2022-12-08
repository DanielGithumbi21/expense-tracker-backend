class CreateSpendings < ActiveRecord::Migration[7.0]
  def change
    create_table :spendings do |t|
      t.integer :income
      t.integer :budget

      t.timestamps
    end
  end
end
