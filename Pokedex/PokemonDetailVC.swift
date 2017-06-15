//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by Jason Shepherd on 6/5/17.
//  Copyright © 2017 Jason Shepherd. All rights reserved.
//

import UIKit



class PokemonDetailVC: UIViewController {
    var pokemon: Pokemon!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bioImage: UIImageView!
    @IBOutlet weak var decriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var baseAttackLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var pokedexIDLbl: UILabel!
    @IBOutlet weak var currentImg: UIImageView!
    @IBOutlet weak var evolutionImg: UIImageView!
    @IBOutlet weak var evolutionLbl: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = pokemon.name.capitalized
        let img = UIImage(named:"\(pokemon.pokedexId)")
        bioImage.image = img
        currentImg.image = img
        pokedexIDLbl.text  = "\(pokemon.pokedexId)"
        
        
        
        pokemon.downloadPokemonDetails {
            //add implementation here"called after network call is complete
            self.updateUI()
        }
      
    }

    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func updateUI(){
        baseAttackLbl.text = pokemon.attack
        defenseLbl.text = pokemon.defense
        heightLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        typeLbl.text = pokemon.type
        decriptionLbl.text = pokemon.description
        
        if pokemon.nextEvolutionID == "" {
            evolutionLbl.text = "No Evolutions"
            evolutionImg.isHidden = true
        } else {
            evolutionImg.isHidden = false
            evolutionImg.image = UIImage(named: pokemon.nextEvolutionID)
            
            let str = "Next Evolution: \(pokemon.nextEvolutionName) - LV \(pokemon.nextEvolutionLv)"
            evolutionLbl.text = str
        }
        
    }
    

   }
