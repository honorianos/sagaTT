//
//  LoginViewController.swift
//  sagaTT
//
//  Created by Oswaldo Jeisson Escobar Huisa on 12/05/22.
//

import UIKit
import JGProgressHUD
import RealmSwift
class LoginViewController: UIViewController {
    
    @IBOutlet var labelTitle: UILabel!
    @IBOutlet var labelSubTitle: UILabel!
    @IBOutlet var imageViewLogo: UIImageView!
    @IBOutlet var textFieldEmail: UITextField!
    @IBOutlet var textFieldPassword: UITextField!
    @IBOutlet var buttonHideShowPassword: UIButton!
    private let presenter = LoginPresenter()
    private let loader = JGProgressHUD(style: .light)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Realm.Configuration.defaultConfiguration.fileURL)
        presenter.setViewDelegate(delegate: self)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        resetTexfields()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        textFieldEmail.setLeftPadding(value: 15)
        textFieldPassword.setLeftPadding(value: 15)
        textFieldPassword.setRightPadding(value: 40)
        labelTitle.text = "Welcome"
        labelSubTitle.text = "app"
    }

    func resetTexfields() {
        textFieldEmail.text = ""
        textFieldPassword.text = ""
    }
    // MARK: - User actions
    
    @IBAction func actionHideShowPassword(_ sender: Any) {
        buttonHideShowPassword.isSelected = !buttonHideShowPassword.isSelected
        textFieldPassword.isSecureTextEntry = !buttonHideShowPassword.isSelected
    }

    @IBAction func actionLogin(_ sender: Any) {
        self.loader.show(in: self.view)
        presenter.validateLogin(username: textFieldEmail.text ?? "", password: textFieldPassword.text ?? "")
    }


}

extension LoginViewController : LoginPresenterDelegate {
    
    func presentValidate(isLoggin: Bool, username: String) {
        self.loader.dismiss()
        if isLoggin {
            let vc = HomeViewController()
            vc.username = username
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
