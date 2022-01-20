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
