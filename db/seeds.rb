require 'json'
require 'rest-client'

61.times do |index|
    unless index == 0 
        url1 = "https://pokeapi.co/api/v2/pokemon/#{index}"
        response1 = RestClient.get url1
        pokemon1 = JSON.parse response1.to_str

        types1 = pokemon1['types'].to_json
        abilities1 = pokemon1['abilities'].to_json

        url2 = "https://pokeapi.co/api/v2/pokemon-species/#{index}"
        response2 = RestClient.get url2
        pokemonSpecies = JSON.parse response2.to_str

        evolutionChainUrl = pokemonSpecies['evolution_chain']['url']

        response3 = RestClient.get evolutionChainUrl
        evoChain = JSON.parse response3.to_str

        evoArr = []
        evoArr.push(evoChain['chain']['species']['name'])

        evoInfo = evoChain['chain']
        while evoInfo['evolves_to'].any? && evoInfo.has_key?('evolves_to') do
            evoArr.push(evoInfo['evolves_to'][0]['species']['name'])
            evoInfo = evoInfo['evolves_to'][0]
        end

        pokeEvolutions = evoArr.to_json

        Pokemon.create({
            name: pokemon1['name'],
            img_url_1: pokemon1['sprites']['other']['official-artwork']['front_default'],
            img_url_2: pokemon1['sprites']['other']['dream_world']['front_default'],
            types: types1,
            weight: pokemon1['weight'],
            abilities: abilities1,
            description: pokemonSpecies['flavor_text_entries'][0]['flavor_text'],
            evolutions: pokeEvolutions,
        })
    end
end
