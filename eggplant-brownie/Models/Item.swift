//
//  Item.swift
//  eggplant-brownie
//
//  Created by Nikolas Gianoglou Coelho on 21/01/22.
//

import UIKit

class Item: NSObject {
    var nome: String
    var calorias: Double
    init(nome: String, calorias: Double){
        self.nome = nome
        self.calorias = calorias
    }
}
