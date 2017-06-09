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

    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = pokemon.name
      
    }

    

   }
