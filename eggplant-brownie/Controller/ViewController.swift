//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Nikolas Gianoglou Coelho on 20/01/22.
//

import UIKit

protocol AdicionaRefeicaoDelegate{
   func add(_ refeicao: Refeicao)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AdicionaItensDelegate {
    
    
    
    //MARK: - Atributos
    var delegate: AdicionaRefeicaoDelegate?
//    var itens: [String] = ["molho de tomate","queijo", "Molho apimentado","Manjericao"]
    var itens: [Item] = []
    var itensSelecionados: [Item] = []
                         
    
    
    //MARK: - IBOutlets
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet var felicidadeTextField: UITextField?
    @IBOutlet weak var itensTableView: UITableView?
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        let botaoAdicionaItem = UIBarButtonItem(title: "adicionar", style: .plain, target: self, action: #selector(self.adicionarItem))
        navigationItem.rightBarButtonItem = botaoAdicionaItem
        recuperaItens()
        
    }
    func recuperaItens(){
        itens = ItemDao().recupera()
    }
    
    //target - lugar onde o botao esta
    @objc func adicionarItem(){
        let adicionarItensViewController = AdicionarItensViewController(delegate: self)
        navigationController?.pushViewController(adicionarItensViewController, animated: true)
    }
    
    func add(_ item: Item) {
        itens.append(item)
        ItemDao().save(itens)
        if let tableView = itensTableView{ //Com if else voce pode tratar caso tableView seja nil
            tableView.reloadData()
        }else{
            Alerta(controller: self).exibe(titulo: "Desculpe", mensagem: "Não foi possivel atualizar a tabela")
        }
    }
    
    //MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        celula.textLabel?.text = itens[indexPath.row].nome
        return celula
    }
    
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        guard let celula = tableView.cellForRow(at: indexPath) else{ return }
        
        if celula.accessoryType == .none{
            celula.accessoryType = .checkmark
            let linhaDataTabela = indexPath.row
            itensSelecionados.append(itens[linhaDataTabela])
        }else{
            celula.accessoryType = .none
            let item = itens[indexPath.row]
            if let position = itensSelecionados.index(of: item){
                itensSelecionados.remove(at: position)
            }
            
        }
        
    }
    
    func recuperaRefeicaoDoFormulario() -> Refeicao? {
        guard let nomeDaRefeicao = nomeTextField?.text else{
            //Alerta(controller: self).exibe(mensagem: "Erro ao ler o campo nome")
            return nil
        }
        
        guard let felicidadeDaRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeDaRefeicao) else{
            //Alerta(controller: self).exibe(mensagem: "Erro ao ler o campo felicidade")
            return nil
        }
        
        let refeicao = Refeicao(nome:nomeDaRefeicao, felicidade: felicidade, itens: itensSelecionados)
        return refeicao
    }
    
    
            
    //MARK: - IBActions
    @IBAction func adicionar(_ sender: Any) {
//        if let nomeDaRefeicao = nomeTextField?.text, let felicidadeDaRefeicao = felicidadeTextField?.text{
//            let nome = nomeDaRefeicao
//            if let felicidade = Int(felicidadeDaRefeicao){
//                let refeicao = Refeicao(nome: nome, felicidade: felicidade)
//                print("comi \(refeicao.nome) e fiquei com felicidade : \(refeicao.felicidade)")
//            }
//
//        }else{
//            print("Erro ao criar a refeicao")
//        }
        
        
        
        if let refeicao = recuperaRefeicaoDoFormulario(){
            delegate?.add(refeicao)
            navigationController?.popViewController(animated: true) //desaparece essa tela
        }else{
            Alerta(controller: self).exibe(mensagem: "Erro ao ler dados do formulário")
        }
        
        
        
    }
    

}

