class PokemonsController < ApplicationController
    def index
        @Pokemons = Pokemon.limit(params[:limit]).offset(params[:offset])
        render json: {status: 'SUCCESS', message: 'Loaded pokemons', data: @Pokemons}, status: :ok
    end
end
