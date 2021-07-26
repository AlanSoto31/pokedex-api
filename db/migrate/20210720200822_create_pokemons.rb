class CreatePokemons < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :img_url_1
      t.string :img_url_2
      t.string :types
      t.string :weight
      t.string :abilities
      t.string :description
      t.string :evolutions

      t.timestamps
    end
  end
end
