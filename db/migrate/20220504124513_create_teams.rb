class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.references :game, null: false, foreign_key: true

      t.string :name
      t.string :code
      t.string :username
      t.string :password
      t.string :token

      t.timestamps
    end
  end
end
