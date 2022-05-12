//
//  HomeCell.swift
//  sagaTT
//
//  Created by Oswaldo Jeisson Escobar Huisa on 12/05/22.
//

import UIKit

class HomeCell: UITableViewCell {
    
    @IBOutlet var labelSearch: UILabel!

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func bindData(search: String) {

        labelSearch.text = search
    }
}
