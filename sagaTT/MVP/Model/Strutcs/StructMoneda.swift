//
//  ResponseMoneda.swift
//  sagaTT
//
//  Created by Oswaldo Jeisson Escobar Huisa on 13/05/22.
//

import Foundation

struct StructMoneda : Codable {
    let version: String
    let autor: String
    let fecha: String
    let uf: itemsMoneda
    let ivp: itemsMoneda
    let dolar: itemsMoneda
    let dolar_intercambio: itemsMoneda
    let euro: itemsMoneda
    let ipc: itemsMoneda
    let utm: itemsMoneda
    let imacec: itemsMoneda
    let tpm: itemsMoneda
    let libra_cobre: itemsMoneda
    let tasa_desempleo: itemsMoneda
    let bitcoin: itemsMoneda
}

public struct itemsMoneda : Codable {
    var codigo: String
    var nombre: String
    var unidad_medida: String
    var fecha: String
    var valor: Double
}

class sMoneda {
    var codigo: String = ""
    var nombre: String = ""
    var unidad_medida: String = ""
    var fecha: String = ""
    var valor: Double = 0.0
}
