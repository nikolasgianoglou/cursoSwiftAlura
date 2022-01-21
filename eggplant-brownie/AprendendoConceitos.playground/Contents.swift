import UIKit

//Array - tipo de coleçao de dados ordenada pelo indice
let totalCalorias = [50.5, 100, 300, 500]



for i in 0...3 {
    //print(i)
    //print(totalCalorias[i])
}

for i in 0...totalCalorias.count-1 {
    //print(i)
    //print(totalCalorias[i])
}

for i in 0..<totalCalorias.count {
    //print(i)
    //print(totalCalorias[i])
}

for caloria in totalCalorias{
    //print(caloria)
}

func todasCalorias(totalDeCalorias: Array<Double>) -> Double{ //a declaracao de um array pode ser tambem: totalDeCalorias: [Double]
    var total: Double = 0
    for caloria in totalDeCalorias{
       total += caloria
    }
    return total
}

let total = todasCalorias(totalDeCalorias: totalCalorias)
print(total)

//Optionals
let optional: Double? = 3.0
func aprendendo(){
    guard let nome = optional else{
        print("Nao ha valor")
        return
    }
}

//Com o guard pode-se usar a variavel em outro escopo do projeto

if let gab = optional{
    print(gab) //gab so pode ser usado dentro desse escopo
}


let numero = Int("5")

//Classes
class Refeicao{
    var nome: String
    var felicidade: String
    
    init(nome:String, felicidade: String){
        self.nome = nome
        self.felicidade = felicidade
    }
}

