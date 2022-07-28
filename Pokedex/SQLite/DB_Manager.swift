//
//  DB_Manager.swift
//  Pokedex
//
//  Created by Thaisa Fujii on 27/07/22.
// https://github.com/stephencelis/SQLite.swift/blob/master/Documentation/Index.md

import Foundation
import SQLite

class DB_Manager {
    
    // sqlite instance
    private var db: Connection!
    // table instance
    private var pokemons: Table!
    // columns instances of table
    private var name: Expression<String>!
    private var url: Expression<String>!
    
    // constructor of this class
    init(){
        
        // exception handling
        do {
            // path of document directory
            let path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first ?? ""
            // creating database connection
            db = try Connection("\(path)/my_pokemons.sqlite3")
            
            // creating table object
            pokemons = Table("pokemon")
            
            // create instances of each column
            name = Expression<String>("name")
            url = Expression<String>("url")
            
            // check if the user's table is already created
            if (!UserDefaults.standard.bool(forKey: "is_db_created")) {
                // if not, then create the table
                try db.run(pokemons.create { (t) in
                    t.column(name)
                    t.column(url)
                })
                
                // set the value to true, so it will not attempt to create the table again
                UserDefaults.standard.set(true, forKey: "is_db_created")
            }
        } catch {
            // show error message if any
            print("Erro ao inicializar o banco")
            print(error.localizedDescription)
        }
    }
    
    // return array of user models
    public func getFavoritePokemonList() -> [Pokemon] {
        //         create empty array
        var pokemonModel: [Pokemon] = []
        // get all users in descending order
        pokemons = pokemons.order(name.desc)
        // exception handling
        do {
            // create new model in each loop iteration
            var pokemon: Pokemon = Pokemon()
            
            // loop through all users
            for item in try db.prepare(pokemons) {
                // to update new content attribute a new empty class
                pokemon = Pokemon()
                // set values in model from database
                pokemon.name = item[name]
                pokemon.url = item[url]
                
                // append in new array
                pokemonModel.append(pokemon)
            }
        } catch {
            print("Erro ao consultar a lista de pokemons favoritos")
            print(error.localizedDescription)
        }
        
        // return array
        return pokemonModel
    }
    
    public func addFavoritePokemon(pokemon: Pokemon){
        print(pokemon)
        do {
            try db.run(pokemons.insert(name <- pokemon.name ?? "", url <- pokemon.url ?? ""))
        } catch {
            print("Erro ao cadastrar o pokemon")
            print(error.localizedDescription)
        }
    }
    // tirar pokemon da lista, delete
    public func deletePokemon(pokemon: Pokemon) {
        do {
            // get user using ID
            let user: Table = pokemons.filter(name == pokemon.name ?? "")
            
            try db.run(user.delete())
        } catch {
            print("Erro ao deletar o Pokemon")
        }
    }
    
    // verificar se tem o nome do pokemon no DB
    public func verifiedIfPokemonIsFavorite(pokemonName: String) -> Bool {
        do {
            let consult = pokemons.where(name == pokemonName)
            
            for item in try db.prepare(consult) {
                print("\(item[name]) pokemon já foi favoritado")
                return true
            }
            print("Pokemon não foi favoritado")
            return false
        } catch {
            print("Erro ao consultar favoritos") // erro amigavel
        }
        return false
    }
}
