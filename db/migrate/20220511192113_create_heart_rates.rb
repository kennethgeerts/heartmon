class CreateHeartRates < ActiveRecord::Migration[7.0]
  def change
    create_table :heart_rates do |t|
      t.references :team, null: false, foreign_key: true

      t.datetime :time
      t.integer :rate, limit: 2

      t.timestamps
    end
  end
end
