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

20.times do |index|
    unless index == 0 
        url = "https://pokeapi.co/api/v2/pokemon/#{index}"
        response = RestClient.get url
        pokemon1 = JSON.parse(response)
        Pokemon.create({
            name: pokemon1['name'],
            img_url: pokemon1['sprites']['front_default'],
            types: pokemon1['types'],
            weight: pokemon1['weight'],
            abilities: pokemon1['abilities'],
        })
    end
end