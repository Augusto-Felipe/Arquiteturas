//
//  LoginViewController.swift
//  Arquiteturas
//
//  Created by Felipe Augusto Correia on 19/07/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        let register = self.storyboard?.instantiateViewController(identifier: "RegisterViewController") as? RegisterViewController
        register?.modalPresentationStyle = .fullScreen
        self.present(register ?? UIViewController(), animated: true)
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        let manager = UserManager(business: UserBusiness())
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            manager.login(email: email, password: password) { user in
                let home = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
                home?.modalPresentationStyle = .fullScreen
                self.present(home ?? UIViewController(), animated: true)
            } failureHandler: { error in
                self.showMessage(title: "Erro", message: "\(error.localizedDescription)")
            }
        }
    }
    
    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
}
