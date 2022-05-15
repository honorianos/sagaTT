//
//  HomePresenter.swift
//  sagaTT
//
//  Created by Oswaldo Jeisson Escobar Huisa on 13/05/22.
//

import UIKit
import JGProgressHUD
import RealmSwift
import CryptoSwift

protocol HomePresenterDelegate: AnyObject {
    func presentGetMonedas(monedas :[itemsMoneda])
}

typealias PresenterHomeDelegate = HomePresenterDelegate & UIViewController

class HomePresenter {
    weak var  delegate: PresenterHomeDelegate?
    private let utils = Utils()
    private let loader = JGProgressHUD(style: .light)
    private let connectRequest = APIconnect()
    private let bdMaster = MonedaDao()
    private var items = [itemsMoneda]()
    public func setViewDelegate(delegate: PresenterHomeDelegate) {
        self.delegate = delegate
        self.loader.textLabel.text = "Cargando"
    }
    
    public func getDataMonedas() {
        loader.show(in: (delegate?.view)!)
        connectRequest.getHistoryReserves(urlString: Utils.baseUrl ){ [self] (response) in
            loader.dismiss()
            guard let responseData = response?.data else { return}
            let valido = self.parseMonedas(responseData)
            if (valido){
                self.delegate?.presentGetMonedas(monedas: items)
            }else{
                self.utils.showSimpleAlert(titulo: "Atención", mensaje: "Error al cargar Data", vc: self.delegate!)
            }
        }
        
        
    }
    
    func parseMonedas (_ datos: Data)-> Bool {
        do{
            let decoder = JSONDecoder()
            let Data = try decoder.decode(StructMoneda.self, from: datos)
            items.append(Data.uf)
            items.append(Data.ivp)
            items.append(Data.dolar)
            items.append(Data.dolar_intercambio)
            items.append(Data.euro)
            items.append(Data.ipc)
            items.append(Data.utm)
            items.append(Data.imacec)
            items.append(Data.tpm)
            items.append(Data.libra_cobre)
            items.append(Data.tasa_desempleo)
            items.append(Data.bitcoin)
            
            for i in items {
                if (bdMaster.getByCodigoNoExiste(codigo: i.codigo)) {
                    bdMaster.insert(moneda: ModelMoneda(
                        codigo: i.codigo.aesEncrypt(),
                        nombre: i.nombre.aesEncrypt(),
                        unidadMedida: i.unidad_medida.aesEncrypt(),
                        fecha: i.fecha.aesEncrypt(),
                        valor: String(i.valor).aesEncrypt())
                    )
                }
            }
            return true
        } catch {
            print(error)
            utils.showSimpleAlert(titulo: "Atención", mensaje: "Ocurrio un error.", vc: self.delegate!)
            return false
        }
    }
    
    
   
}
