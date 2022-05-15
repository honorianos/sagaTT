//
//  DetailMoneda.swift
//  sagaTT
//
//  Created by Oswaldo Jeisson Escobar Huisa on 14/05/22.
//

import UIKit

class DetailMonedaController: UIViewController {
    var ViewData: ViewDataDetail!
    @IBOutlet weak var codigo: UIButton!
    @IBOutlet weak var nombre: UITextField!
    @IBOutlet weak var unidad: UITextField!
    @IBOutlet weak var fecha: UITextField!
    @IBOutlet weak var valor: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.title = "Detalle Moneda"
        codigo.setTitle("Código: " + ViewData.codigo, for: .normal)
        nombre.text = "Nombre: " + ViewData.nombre
        unidad.text = "Unidad  de Medidad: " + ViewData.unidad_medida
        fecha.text = "Fecha: " + ViewData.fecha
        valor.text = "Valor: " + String(ViewData.valor)
    }
}
