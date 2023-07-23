//
//  RegisterView.swift
//  Arquiteturas
//
//  Created by Felipe Augusto Correia on 23/07/23.
//

import UIKit

class RegisterView: UIView {
    
    var registerTap:((_ user: User) -> Void)?
    
    lazy var emailLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Email"
        lb.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        lb.textColor = UIColor.white
        return lb
    }()
    
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Digite seu email"
        tf.autocorrectionType = .no
        tf.keyboardType = .emailAddress
        tf.layer.cornerRadius = 12
        tf.layer.borderColor = UIColor.lightGray.cgColor
        tf.layer.borderWidth = 1
        tf.backgroundColor = .white
        tf.autocapitalizationType = .none
        tf.setLeftPaddingPoints(10)
        return tf
    }()
    
    lazy var passwordLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Senha"
        lb.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        lb.textColor = UIColor.white
        return lb
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Digite sua senha"
        tf.autocorrectionType = .no
        tf.keyboardType = .default
        tf.layer.cornerRadius = 12
        tf.layer.borderColor = UIColor.lightGray.cgColor
        tf.layer.borderWidth = 1
        tf.isSecureTextEntry = true
        tf.backgroundColor = .white
        tf.autocapitalizationType = .none
        tf.setLeftPaddingPoints(10)
        return tf
    }()
    
    lazy var confirmPasswordLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Confirmar senha"
        lb.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        lb.textColor = UIColor.white
        return lb
    }()
    
    lazy var confirmPasswordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Confirme sua senha"
        tf.autocorrectionType = .no
        tf.keyboardType = .default
        tf.layer.cornerRadius = 12
        tf.layer.borderColor = UIColor.lightGray.cgColor
        tf.layer.borderWidth = 1
        tf.isSecureTextEntry = true
        tf.backgroundColor = .white
        tf.autocapitalizationType = .none
        tf.setLeftPaddingPoints(10)
        return tf
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Entrar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Registrar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func loginButtonTapped() {
        
    }
    
    @objc func registerButtonTapped() {
        if let email = emailTextField.text, let password = passwordTextField.text, let confirmPassword = confirmPasswordTextField.text  {
            if password == confirmPassword {
                if email.count < 1 {
                    print("email vazio")
                }
                
                if password.count < 1 {
                    print("Senha vazia")
                }
                self.registerTap?(User(email: email, password: password))
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemMint
        addElements()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(emailLabel)
        addSubview(emailTextField)
        addSubview(passwordLabel)
        addSubview(passwordTextField)
        addSubview(confirmPasswordLabel)
        addSubview(confirmPasswordTextField)
        addSubview(loginButton)
        addSubview(registerButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            emailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            passwordLabel.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            confirmPasswordLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),
            confirmPasswordLabel.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            
            confirmPasswordTextField.topAnchor.constraint(equalTo: confirmPasswordLabel.bottomAnchor, constant: 10),
            confirmPasswordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            confirmPasswordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            confirmPasswordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            loginButton.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: 25),
            loginButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            loginButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 15),
            registerButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            registerButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
        ])
    }
}
