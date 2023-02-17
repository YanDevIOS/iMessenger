//
//  RegisterController.swift
//  Messenger
//
//  Created by Yan Alejandro on 14/02/23.
//

import UIKit
import FirebaseAuth

class RegisterController: UIViewController {

    var screen: RegisterScreen?
    
    var auth: Auth?
    
    override func loadView() {
        screen = RegisterScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.configTextFieldDelegate(delegate: self)
        screen?.delegate(delegate: self)
        auth = Auth.auth()
    }
}

extension RegisterController: RegisterScreenProtocol {
    func tappedRegisterButton() {
        let email: String = screen?.emailTextField.text ?? ""
        let password: String = screen?.passwordTextField.text ?? ""
        auth?.createUser(withEmail: email, password: password, completion: { (result, error) in
            if error != nil {
                print("Erro ao cadastrar")
            } else {
                print("Sucesso ao cadastrar")
            }
        })
    }
    
    func tappedBackButton() {
        navigationController?.popViewController(animated: true)
    }
}

extension RegisterController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        screen?.validaTextField()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
