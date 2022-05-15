//
//  MonedaDao.swift
//  sagaTT
//
//  Created by Oswaldo Jeisson Escobar Huisa on 13/05/22.
//

import Foundation
import RealmSwift

public class MonedaDao {
    
    init(){
        
    }
    func getByCodigo(codigo: String) -> Results<ModelMoneda> {
        let results: Results<ModelMoneda> = db.objects(ModelMoneda.self).filter("codigo = %@", codigo)
        return results
    }
   
    func insert(moneda: ModelMoneda) -> Void {
        try! db.write {
            db.add(moneda, update: .all)
        }
    }
    
    func getByCodigoNoExiste(codigo: String) -> Bool {
        let results: Results<ModelMoneda> = db.objects(ModelMoneda.self).filter("codigo = %@", codigo)
        if results.count == 0{
            return true
        }else{
            return false
        }
    }
    
    func deleteAllFromDatabase()  {
        try!   db.write {
            db.deleteAll()
        }
    }
    
    func getall() -> [ModelMoneda] {
        let results: Results<ModelMoneda> = db.objects(ModelMoneda.self)
        var monedas = [ModelMoneda]()
        for i in results {
            let tmp = ModelMoneda(
                codigo: i.codigo,
                nombre: i.nombre,
                unidadMedida: i.unidadMedida,
                fecha: i.fecha,
                valor: i.valor
            )
            monedas.append(tmp)
        }
        return monedas
    }
    
}
