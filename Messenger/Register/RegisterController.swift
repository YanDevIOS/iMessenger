//
//  RegisterController.swift
//  Messenger
//
//  Created by Yan Alejandro on 14/02/23.
//

import UIKit

class RegisterController: UIViewController {

    var screen: RegisterScreen?
    
    override func loadView() {
        screen = RegisterScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.configTextFieldDelegate(delegate: self)
        screen?.delegate(delegate: self)
    }
}

extension RegisterController: RegisterScreenProtocol {
    func tappedRegisterButton() {
        print("Register Button!!!")
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
