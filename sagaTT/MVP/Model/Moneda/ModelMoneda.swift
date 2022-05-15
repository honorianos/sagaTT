//
//  ModelMoneda.swift
//  sagaTT
//
//  Created by Oswaldo Jeisson Escobar Huisa on 13/05/22.
//

import Foundation
import RealmSwift

class ModelMoneda: Object, Decodable {
    // MARK: - attributes
    @objc dynamic var codigo: String = ""
    @objc dynamic var nombre: String = ""
    @objc dynamic var unidadMedida: String = ""
    @objc dynamic var fecha: String = ""
    @objc dynamic var valor: String = ""
    // MARK: - PK
    @objc open override class func primaryKey() -> String {
        return "codigo"
    }
    // MARK: - init
    convenience init(
        codigo: String,
        nombre: String,
        unidadMedida: String,
        fecha: String,
        valor: String
    ){
        self.init()
        self.codigo = codigo
        self.nombre = nombre
        self.unidadMedida = unidadMedida
        self.fecha = fecha
        self.valor = valor
    }

}
