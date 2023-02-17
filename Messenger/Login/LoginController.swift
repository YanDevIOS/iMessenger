//
//  LoginController.swift
//  Messenger
//
//  Created by Yan Alejandro on 14/02/23.
//

import UIKit

class LoginController: UIViewController {

    var screen: LoginScreen?
    
    override func loadView() {
        screen = LoginScreen()
        view = screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.configTextFieldDelegate(delegate: self)
        screen?.delegate(delegate: self)
    }
}

extension LoginController: LoginScreenProtocol {
    func tappedLoginButton() {
        print("ACAO LOGIN BUTTON")
    }
    
    func tappedRegisterButton() {
        let vc = RegisterController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension LoginController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        screen?.validaTextField()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    
}

