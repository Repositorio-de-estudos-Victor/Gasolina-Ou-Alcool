//
//  ViewController.swift
//  Gasolina Ou Alcool
//
//  Created by Victor Rodrigues Novais on 22/04/20.
//  Copyright © 2020 Victoriano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultadoLegenda: UILabel!
    @IBOutlet weak var precoAlcool: UITextField!
    @IBOutlet weak var precoGasolina: UITextField!
    
    @IBAction func calcularCombustivel(_ sender: Any) {
        
        if let precoAlc = precoAlcool.text {
            if let precoGas = precoGasolina.text {
                
                // Validar valores digitados
                let validaCampos = self.validarCampos(precoAlcool: precoAlc, precoGasolina: precoGas)
                
                if validaCampos {
                    self.calcularMelhorPreco(precoAlcool: precoAlc, precoGasolina: precoGas)
                } else {
                    resultadoLegenda.text = "Digite os preços para calcular"
                }
            }
        }
        
    }
    
    func calcularMelhorPreco(precoAlcool: String, precoGasolina: String){
        // Converte valor textos para numeros
        if let valorAlcool = Double(precoAlcool){
            if let valorGasolina = Double(precoGasolina) {
                /* Faz cálculo (precoAlcool / precoGasolina )
                   Se resultado >= 0.7 melhor utilizar gasolina
                   senão melhor utilizar álcool
                 */
                
                let resultadoPreco = valorAlcool / valorGasolina
                
                if resultadoPreco >= 0.7 {
                    self.resultadoLegenda.text = "Melhor utilizar Gasolina!"
                } else {
                    self.resultadoLegenda.text = "Melhor utilizar Álcool!"
                }
            }
        }
        
        
        
    }
    
    func validarCampos(precoAlcool: String, precoGasolina: String) -> Bool {
        
        var camposValidados = true
        
        if precoAlcool.isEmpty {
            camposValidados = false
        } else if precoGasolina.isEmpty {
            camposValidados = false
        }
        
        return camposValidados
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

