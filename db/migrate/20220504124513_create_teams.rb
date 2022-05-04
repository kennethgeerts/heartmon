class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :code
      t.string :username
      t.string :password
      t.string :token
      t.references :game

      t.timestamps
    end
  end
end
