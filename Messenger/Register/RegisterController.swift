//
//  RegisterController.swift
//  Messenger
//
//  Created by Yan Alejandro on 14/02/23.
//

import UIKit
import FirebaseAuth

class RegisterController: UIViewController {

    var registerScreen: RegisterScreen?
    
    var auth: Auth?
    
    override func loadView() {
        registerScreen = RegisterScreen()
        view = registerScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerScreen?.configTextFieldDelegate(delegate: self)
        registerScreen?.delegate(delegate: self)
        auth = Auth.auth()
    }
}

extension RegisterController: RegisterScreenProtocol {
    func tappedRegisterButton() {
        
        guard let register = registerScreen else {return}
        
        auth?.createUser(withEmail: register.getEmail(), password: register.getPassword(), completion: { (result, error) in
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
        registerScreen?.validaTextField()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
