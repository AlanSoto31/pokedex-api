class CreatePokemons < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :img_url
      t.string :type
      t.string :weight
      t.string :ability

      t.timestamps
    end
  end
end
