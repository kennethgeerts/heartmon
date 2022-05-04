class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :name
      t.string :client
      t.datetime :start_at
      t.datetime :stop_at

      t.timestamps
    end
  end
end
