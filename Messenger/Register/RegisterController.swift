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
    var alert: Alert?
    
    override func loadView() {
        registerScreen = RegisterScreen()
        view = registerScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerScreen?.configTextFieldDelegate(delegate: self)
        registerScreen?.delegate(delegate: self)
        auth = Auth.auth()
        alert = Alert(controller: self)
    }
}

extension RegisterController: RegisterScreenProtocol {
    func tappedRegisterButton() {
        
        guard let register = registerScreen else {return}
        
        auth?.createUser(withEmail: register.getEmail(), password: register.getPassword(), completion: { (result, error) in
            if error != nil {
                self.alert?.getAlert(title: "Atenção", message: "Erro ao cadastrar, verique os dados e tente novamente")
            } else {
                self.alert?.getAlert(title: "Parabéns", message: "Usuário cadastrado com sucesso", completion: {
                    self.navigationController?.popViewController(animated: true)
                })
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
