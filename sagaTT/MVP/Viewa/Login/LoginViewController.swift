//
//  LoginViewController.swift
//  sagaTT
//
//  Created by Oswaldo Jeisson Escobar Huisa on 12/05/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var labelTitle: UILabel!
    @IBOutlet var labelSubTitle: UILabel!
    @IBOutlet var imageViewLogo: UIImageView!
    @IBOutlet var textFieldEmail: UITextField!
    @IBOutlet var textFieldPassword: UITextField!
    @IBOutlet var buttonHideShowPassword: UIButton!

    //-------------------------------------------------------------------------------------------------------------------------------------------
    override func viewDidLoad() {

        super.viewDidLoad()

        textFieldEmail.setLeftPadding(value: 15)
        textFieldPassword.setLeftPadding(value: 15)
        textFieldPassword.setRightPadding(value: 40)

        loadData()
    }

    // MARK: - Data methods
    //-------------------------------------------------------------------------------------------------------------------------------------------
    func loadData() {

        labelTitle.text = "Welcome to\nAppDesignKit"
        labelSubTitle.text = "An exciting place for the whole family to shop."
    }

    // MARK: - User actions
    //-------------------------------------------------------------------------------------------------------------------------------------------
    @IBAction func actionHideShowPassword(_ sender: Any) {

        buttonHideShowPassword.isSelected = !buttonHideShowPassword.isSelected
        textFieldPassword.isSecureTextEntry = !buttonHideShowPassword.isSelected
    }

    //-------------------------------------------------------------------------------------------------------------------------------------------
    @IBAction func actionLogin(_ sender: Any) {

        print(#function)
        dismiss(animated: true)
        let shipping3View = HomeViewController()
        navigationController?.pushViewController(shipping3View, animated: true)
    }

    //-------------------------------------------------------------------------------------------------------------------------------------------
    @IBAction func actionForgotPassword(_ sender: Any) {

        print(#function)
        dismiss(animated: true)
    }

    //-------------------------------------------------------------------------------------------------------------------------------------------
    @IBAction func actionSignUp(_ sender: Any) {

        print(#function)
        dismiss(animated: true)
    }
}

