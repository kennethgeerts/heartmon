class CreateModels < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :name
      t.string :client
      t.datetime :start_at
      t.datetime :stop_at
      t.timestamps
    end

    create_table :teams do |t|
      t.references :game, null: false, foreign_key: true
      t.string :name
      t.string :code
      t.string :username
      t.string :password
      t.string :token

      t.integer :rate, limit: 2
      t.datetime :measured_at

      t.integer :rate_min, limit: 2
      t.integer :rate_max, limit: 2

      t.integer :rate_sum, default: 0
      t.integer :rate_count, default: 0
      t.virtual :rate_avg, type: :integer, as: 'rate_sum / NULLIF(rate_count, 0)', stored: true

      t.timestamps
    end

    create_table :heart_rates do |t|
      t.references :team, null: false, foreign_key: true
      t.integer :rate, limit: 2
      t.datetime :measured_at
    end
  end
end
