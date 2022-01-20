import UIKit

//Declarando variaveis no Swift
//Há 2 formas:
var nome: String = "Primeira forma" //explicito
var endereco = "Segunda forma" //implicito
//Lembre-se: siga um padrao

print(nome)

//Pode-se usar variaveis ou constantes
let constante  = "nao pode mudar de valor"
var variavel = "pode-se mudar o valor"
//Boa pratica: valores que nao mudam é melhor usar let, para nao correr risco de mudar um valor que nao deve ser mudado em alguma parte do programa

//Uma forma de se comentar em uma linha

/*
 Uma forma
 de se comentar
 em mais de uma linha
 */

//Outros tipos de variaveis
let felicidade = 5
let calorias = 79.5
let vegetal:Bool = false

//Declaracao de funcoes
func alimentoConsumido(){
    print("os alimentos consumidos foram: \(nome)")
}

alimentoConsumido()

//Metodos com parametros
func method(par1: String, par2: Double){
    print("Este metodo tem 2 parametros: \(par1) e \(par2)")
}
method(par1 : "Nikolas", par2 : 33.3)


