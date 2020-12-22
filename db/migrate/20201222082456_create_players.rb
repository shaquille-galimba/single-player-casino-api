class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :latest_score, :default => 0
      t.integer :highest_score, :default => 0
      t.integer :profit, :default => 0
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
