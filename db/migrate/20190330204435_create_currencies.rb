class CreateCurrencies < ActiveRecord::Migration[5.2]
  def change
    create_table :currencies do |t|
      t.string :base
      t.datetime :date
      t.json :rates

      t.timestamps
    end
  end
end
