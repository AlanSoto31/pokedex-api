# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'rest-client'


# pokemon1['types'][0]['type']['name']
# pokemon1['abilities'][0]['ability']['name']

11.times do |index|
    unless index == 0 
        url1 = "https://pokeapi.co/api/v2/pokemon/#{index}"
        response1 = RestClient.get url1
        pokemon1 = JSON.parse(response1)

        url2 = "https://pokeapi.co/api/v2/characteristic/#{index}"
        response2 = RestClient.get url2
        pokemonDescription = JSON.parse(response2)

        url3 = "https://pokeapi.co/api/v2/evolution-chain/#{index}"
        response3 = RestClient.get url3
        pokemonEvolutions = JSON.parse(response3)

        Pokemon.create({
            name: pokemon1['name'],
            img_url: pokemon1['sprites']['front_default'],
            types: pokemon1['types'],
            weight: pokemon1['weight'],
            abilities: pokemon1['abilities'],
            description: pokemonDescription['descriptions'][2],
            evolutions: pokemonEvolutions['chain']['evolves_to']
        })
    end
end