//
//  Pokemon.swift
//  Pokedex
//
//  Created by Jason Shepherd on 6/2/17.
//  Copyright © 2017 Jason Shepherd. All rights reserved.
//

import Foundation
import Alamofire



class Pokemon{
    
    private var _name: String!
    private var _pokedexId: Int!
    private var _description: String!
    private var _type: String!
    private var _height: String!
    private var _weight: String!
    private var _attack:String!
    private var _defense:String!
    private var _evolutionLbl:String!
    private var _nextEvolutionName: String!
    private var _nextEvolutionID:String!
    private var _nextEvolutionLv:String!
    private var _pokemanURL:String!
   
    
    
    
    
    
   
    var  name: String{
        return _name
    }
    
    var type: String {
        if _type == nil{
            _type = ""
        }
        return _type
    }
    
    var description: String {
        if _description == nil{
            _description = ""
        }
        return _description
    }
   
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    var evolutionLbl: String {
        if _evolutionLbl == nil{
            _evolutionLbl = ""
        }
            return _evolutionLbl
        }
    
    var nextEvolutionID:String {
        if _nextEvolutionID == nil {
            _nextEvolutionID = ""
        }
        return _nextEvolutionID
    }
    
//    var nextEvolutionID:String {
//        if _nextEvolutionID == nil {
//            _nextEvolutionID = ""
//        }
//        return _nextEvolutionID
//    }

    
    var nextEvolutionLv: String {
        if _nextEvolutionLv == nil{
            _nextEvolutionLv = ""
        }
        return _nextEvolutionLv
    }

    var evolutionName: String {
        if _nextEvolutionName == nil{
            _nextEvolutionName = ""
        }
        return _nextEvolutionName
    }

    
    var defense: String {
        if _defense == nil{
            _defense = ""
        }
        return _defense
    }
    
    var attack: String {
        if _attack == nil{
            _attack = ""
        }
        return _attack
    }
    
    var weight: String {
        if _weight == nil{
            _weight = ""
        }
        return _weight
    }
    
    var height: String {
        if _height == nil{
            _height = ""
        }
        return _height
    }
    
    
    
    
    init(name: String, pokedexId: Int){
        self._name = name
        self._pokedexId = pokedexId
        self._pokemanURL = "\(URL_BASE)\(URL_POKEMON)\(self.pokedexId)/"
        self._description = description
        
    }
    
    
    func downloadPokemonDetails(completed:@escaping DownloadComplete) {
        Alamofire.request(_pokemanURL).responseJSON { (response) in
          if let dict = response.result.value as? Dictionary<String,Any> {
                if let weight = dict["weight"] as? String {
                    self._weight = weight
                }
            if let height = dict["height"] as? String {
                self._height = height
            }
            if let attack = dict["attack"] as? Int {
                self._attack = "\(attack)"
            }
            if let defense = dict["defense"] as? Int {
                self._defense = "\(defense)"
            }
            if let types = dict["types"] as? [Dictionary<String,String>] , types.count > 0{
                if let name = types[0]["name"] {
                    self._type = name.capitalized
                }
                if types.count > 1{
                    for x in 1..<types.count{
                        if let name = types[x]["name"]{
                            self._type! += "/\(name.capitalized)"
                        }
                    }
                }
            } else {
                self._type = ""
            }
            
            if let descriptionArray = dict["descriptions"] as? [Dictionary<String,Any>] , descriptionArray.count > 0 {
                if let url = descriptionArray[0]["resource_uri"] {
                    let descriptionURL = "\(URL_BASE)\(url)"
                    Alamofire.request(descriptionURL).responseJSON(completionHandler:{ (response) in
                        if let descriptionDictionary = response.result.value as? Dictionary<String, Any>{
                            if let description = descriptionDictionary["description"] as? String {
                                
                                let newDescription = description.replacingOccurrences(of: "POKMON", with: "Pokemon")
                                self._description = newDescription
                                print(newDescription)
                                
                            }
                        }
                        completed()
                     
                    })
                }
            } else {
                self._description = ""
            }
            
            if let evolutions = dict["evolutions"] as? [Dictionary<String,Any>], evolutions.count > 0 {
                if let nextEvolutions = evolutions[0]["to"] as? String {
                    if nextEvolutions.range(of: "mega") == nil{
                        self._nextEvolutionName = nextEvolutions
                        
                        if let uri = evolutions[0]["reources_uri"] as? String{
                            let newStr = uri.replacingOccurrences(of: "/api/v1/pokemon", with: "")
                            let nextEvolutionID = newStr.replacingOccurrences(of: "/", with: "")
                            
                            self._nextEvolutionID = nextEvolutionID
                            
                            if let lvlExist = evolutions[0]["level"]{
                                if let lvl = lvlExist as? Int{
                                    self._nextEvolutionLv = "\(lvl)"
                                }
                                
                            } else {
                                self._nextEvolutionLv = ""
                            }
                        }
                        
                    }
                }
            }
            
            
            print(self._nextEvolutionLv)
            print(self._nextEvolutionID)
            print(self._nextEvolutionName)
                
            }
            
            completed()
        }
        
    }
    
    
    
    
}
