//
//  Item.swift
//  eggplant-brownie
//
//  Created by Nikolas Gianoglou Coelho on 21/01/22.
//

import UIKit

class Item: NSObject, NSCoding {
    
    //MARK: - Atributos
    var nome: String
    var calorias: Double
    
    //MARK: - Construtor
    init(nome: String, calorias: Double){
        self.nome = nome
        self.calorias = calorias
    }
    //MARK: - NSCoding
    func encode(with coder: NSCoder) {
        coder.encode(nome, forKey: "nome")
        coder.encode(calorias, forKey: "calorias")
    }
    
    required init?(coder: NSCoder) {
        nome = coder.decodeObject(forKey: "nome") as! String
        calorias = coder.decodeDouble(forKey: "calorias")
    }
}
