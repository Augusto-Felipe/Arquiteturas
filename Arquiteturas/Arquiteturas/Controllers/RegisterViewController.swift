//
//  RegisterViewController.swift
//  Arquiteturas
//
//  Created by Felipe Augusto Correia on 19/07/23.
//

import UIKit
import Foundation

class RegisterViewController: UIViewController {
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text, let confirmPassword = confirmPasswordTextField.text {
            if password == confirmPassword {
                let manager = UserManager(business: UserBusiness())
                manager.register(email: email, password: password) { user in
                    self.showHomeView()
                } failureHandler: { error in
                    self.showMessage(title: "Erro", message: "\(error.localizedDescription)")
                }

            } else {
                showMessage(title: "Erro", message: "Senhas não coincidem.")
            }
        } else {
            showMessage(title: "Erro", message: "Preencha todos os campos.")
        }
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    func showHomeView() {
        let home = self.storyboard?.instantiateViewController(identifier: "HomeViewController") as? HomeViewController
        home?.modalPresentationStyle = .fullScreen
        self.present(home ?? UIViewController(), animated: true)
    }
}
