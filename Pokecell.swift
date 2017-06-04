//
//  Pokecell.swift
//  Pokedex
//
//  Created by Jason Shepherd on 6/3/17.
//  Copyright © 2017 Jason Shepherd. All rights reserved.
//

import UIKit

class Pokecell: UICollectionViewCell {
 
    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    var pokemon : Pokemon!
    
    //rounded corners
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 5.0
    }
    
    
    func configureCell(_ pokemon: Pokemon){
        self.pokemon = pokemon
        nameLabel.text = self.pokemon.name.capitalized
        thumbnailImage.image = UIImage(named: "\(self.pokemon.pokedexId)")
        
        
    }
    
    
    
    
}
