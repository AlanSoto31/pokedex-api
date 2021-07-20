class PokemonsController < ApplicationController
    def index
        pokemons = Pokemon.all
        render json: {status: 'SUCCESS', message: 'Loaded pokemons', data: pokemons}, status: :ok
      end
end
