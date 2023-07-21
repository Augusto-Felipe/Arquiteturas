//
//  ViewController.swift
//  Arquiteturas
//
//  Created by Felipe Augusto Correia on 19/07/23.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    let presenter: LoginPresenter = LoginPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.delegate = self
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            presenter.login(user: User(email: email, password: password))
        }
    }
    
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        
    }
}

extension LoginViewController: LoginPresenterProtocol {
    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    func goHome() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let home = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        home.modalPresentationStyle = .fullScreen
        self.present(home, animated: true)
    }
}
