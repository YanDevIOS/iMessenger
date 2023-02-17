//
//  RegisterScreen.swift
//  Messenger
//
//  Created by Yan Alejandro on 14/02/23.
//

import UIKit

protocol RegisterScreenProtocol: AnyObject {
    func tappedBackButton()
    func tappedRegisterButton()
}

class RegisterScreen: UIView {
    
    private weak var delegate: RegisterScreenProtocol?
    
    public func delegate(delegate: RegisterScreenProtocol?) {
        self.delegate = delegate
    }
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.tintColor = .white
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedBackButton() {
        delegate?.tappedBackButton()
    }
    
    lazy var registerUserImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "person")
        image.contentMode = .scaleAspectFit
        image.tintColor = .white
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Cadastro"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .white
        return label
    }()
    
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.keyboardType = .default
        textField.placeholder = "Digite o seu nome completo"
        textField.textColor = .darkGray
        return textField
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.placeholder = "Digite o seu email"
        textField.textColor = .darkGray
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.keyboardType = .default
        textField.isSecureTextEntry = true
        textField.textColor = .darkGray
        textField.placeholder = "Digite sua senha"
        return textField
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastrar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor = UIColor(red: 44/255, green: 54/255, blue: 57/255, alpha: 1.0)
        button.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedRegisterButton() {
        delegate?.tappedRegisterButton()
    }
    
    public func validaTextField() {
        let name: String = nameTextField.text ?? ""
        let email: String = emailTextField.text ?? ""
        let senha: String = passwordTextField.text ?? ""
        
        if !name.isEmpty && !email.isEmpty && !senha.isEmpty {
            configButtonEnabble(true)
        } else {
            configButtonEnabble(false)
        }
    }
    
    private func configButtonEnabble(_ enable: Bool) {
        if enable {
            registerButton.setTitleColor(.white, for: .normal)
            registerButton.isEnabled = true
        } else {
            registerButton.setTitleColor(.lightGray, for: .normal)
            registerButton.isEnabled = false
        }
    }
    
    public func getEmail() -> String {
        return emailTextField.text ?? ""
    }
    
    public func getPassword() -> String {
        return passwordTextField.text ?? ""
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configButtonEnabble(false)
        configBackground()
        addComponentsInSubview()
        addConstraintsSnapkit()
    }
    
    func addComponentsInSubview() {
        addSubview(titleLabel)
        addSubview(backButton)
        addSubview(registerUserImage)
        addSubview(nameTextField)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(registerButton)
    }
    
    func addConstraintsSnapkit() {
        configTitleLabelConstraints()
        configBackButtonConstraints()
        configRegisterUserImageConstraints()
        configNameTextFieldConstraints()
        configEmailTextFieldConstraints()
        configPasswordTextFieldConstraints()
        configRegisterButtonConstraints()
    }
    
    func configBackground() {
        backgroundColor = UIColor(red: 57/255, green: 91/255, blue: 100/255, alpha: 1.0)
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate) {
        nameTextField.delegate = delegate
        emailTextField.delegate = delegate
        passwordTextField.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configTitleLabelConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(40)
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().inset(40)
        }
    }
    
    func configBackButtonConstraints() {
        backButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.top)
            make.leading.equalToSuperview().offset(20)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
    }
    
    func configRegisterUserImageConstraints() {
        registerUserImage.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(150)
        }
    }
    
    func configNameTextFieldConstraints() {
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(registerUserImage.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(40)
        }
    }
    
    func configEmailTextFieldConstraints() {
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(20)
            make.leading.equalTo(nameTextField.snp.leading)
            make.trailing.equalTo(nameTextField.snp.trailing)
            make.height.equalTo(nameTextField.snp.height)
        }
    }
    
    func configPasswordTextFieldConstraints() {
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
            make.leading.equalTo(nameTextField.snp.leading)
            make.trailing.equalTo(nameTextField.snp.trailing)
            make.height.equalTo(nameTextField.snp.height)
        }
    }
    
    func configRegisterButtonConstraints() {
        registerButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.leading.equalTo(nameTextField.snp.leading)
            make.trailing.equalTo(nameTextField.snp.trailing)
            make.height.equalTo(nameTextField.snp.height)
        }
    }
    
}
