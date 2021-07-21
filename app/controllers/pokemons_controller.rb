class PokemonsController < ApplicationController
    def index
        @Pokemons = Pokemon.all
        render json: {status: 'SUCCESS', message: 'Loaded pokemons', data: @Pokemons}, status: :ok
    end
end
