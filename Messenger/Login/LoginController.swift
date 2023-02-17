//
//  LoginController.swift
//  Messenger
//
//  Created by Yan Alejandro on 14/02/23.
//

import UIKit
import FirebaseAuth

class LoginController: UIViewController {

    var auth: Auth?
    var loginScreen: LoginScreen?
    var alert: Alert?
    
    override func loadView() {
        loginScreen = LoginScreen()
        view = loginScreen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loginScreen?.configTextFieldDelegate(delegate: self)
        loginScreen?.delegate(delegate: self)
        auth = Auth.auth()
        alert = Alert(controller: self)
    }
}

extension LoginController: LoginScreenProtocol {
    func tappedLoginButton() {
        let vc = HomeController()
        
        guard let login = loginScreen else {return}

        self.auth?.signIn(withEmail: login.getEmail(), password: login.getPassword(), completion: { (usuario, error) in
            if error != nil {
                self.alert?.getAlert(title: "Atenção", message: "Atenção dados incorretos, verifique e tente Novamente!!!")
            } else {
                if usuario == nil {
                    self.alert?.getAlert(title: "Atenção", message: "Tivemos um problema inesperado, tente novamente mais tarde")
                } else {
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
        })
    }
    
    func tappedRegisterButton() {
        let vc = RegisterController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension LoginController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        loginScreen?.validaTextField()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    
}

