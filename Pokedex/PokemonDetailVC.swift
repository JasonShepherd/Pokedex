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

        nameLabel.text = pokemon.name
        
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
    }
    

   }
