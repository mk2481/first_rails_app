json.extract! pokemon, :id, :number, :name, :type1, :type2, :ability1, :ability2, :hidden_ability, :hp, :attack, :defence, :sp_attack, :sp_defence, :speed, :total, :created_at, :updated_at
json.url pokemon_url(pokemon, format: :json)
