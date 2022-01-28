//
//  AdicionarItensViewController.swift
//  eggplant-brownie
//
//  Created by Nikolas Gianoglou Coelho on 24/01/22.
//

import UIKit

protocol AdicionaItensDelegate{
    func add(_ item: Item)
}

class AdicionarItensViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var caloriasTextField: UITextField!
    
    // MARK: - Atributos
    var delegate: AdicionaItensDelegate?
    
    init(delegate: AdicionaItensDelegate){
        super.init(nibName: "AdicionarItensViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // MARK: - IBAction
    
    @IBAction func adicionarItem(_ sender: Any) {
        //navegar para proxima tela: navigationController.push
        //voltar para tela anterior: navigationController.pop
        guard let nome = nomeTextField.text, let calorias = caloriasTextField.text else{ return }
        
        if let numeroDeCalorias = Double(calorias){
            let item = Item(nome: nome, calorias: numeroDeCalorias)
            delegate?.add(item)// se a variavel existir ele chama o metodo add, se nao existir nao faz nada
            navigationController?.popViewController(animated: true)
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
