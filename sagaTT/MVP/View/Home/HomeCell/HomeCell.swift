//
//  HomeCell.swift
//  sagaTT
//
//  Created by Oswaldo Jeisson Escobar Huisa on 12/05/22.
//

import UIKit

class HomeCell: UITableViewCell {
    
    @IBOutlet weak var lblName: UILabel!
    
    func bindData(data: itemsMoneda) {
        lblName.text = String("\(data.nombre) - valor: \(String(data.valor))")
    }
}
