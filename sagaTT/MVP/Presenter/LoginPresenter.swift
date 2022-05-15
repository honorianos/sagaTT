//
//  LoginPresenter.swift
//  sagaTT
//
//  Created by Oswaldo Jeisson Escobar Huisa on 13/05/22.
//

import Foundation
import UIKit


protocol LoginPresenterDelegate: AnyObject {
    func presentValidate(isLoggin :Bool, username: String)
}

typealias PresenterDelegate = LoginPresenterDelegate & UIViewController

class LoginPresenter {
    weak var  delegate: PresenterDelegate?
    private let utils = Utils()
    
    public func setViewDelegate(delegate: PresenterDelegate) {
        self.delegate = delegate
    }
    
    public func validateLogin(username: String, password: String) {
        if username.isEmpty || password.isEmpty {
            self.utils.showSimpleAlert(titulo: "Atención", mensaje: "Datos no validos", vc: delegate!.self)
        }
        if ( UsersUtil.validateLogin(username: username, password: password) ) {
            delegate?.presentValidate(isLoggin: true, username: username)
        }
        else {
            self.utils.showSimpleAlert(titulo: "Atención", mensaje: "Usuario no valido", vc: delegate!.self)
            delegate?.presentValidate(isLoggin: false, username: username)
        }
    }
}
