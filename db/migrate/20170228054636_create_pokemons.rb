class CreatePokemons < ActiveRecord::Migration[5.0]
  def change
    create_table :pokemons do |t|
      t.string :number
      t.string :name
      t.string :type1
      t.string :type2
      t.string :ability1
      t.string :ability2
      t.string :hidden_ability
      t.integer :hp
      t.integer :attack
      t.integer :defence
      t.integer :sp_attack
      t.integer :sp_defence
      t.integer :speed
      t.integer :total

      t.timestamps
    end
  end
end
