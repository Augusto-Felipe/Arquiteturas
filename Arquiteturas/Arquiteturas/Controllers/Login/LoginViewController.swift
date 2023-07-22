//
//  ViewController.swift
//  Arquiteturas
//
//  Created by Felipe Augusto Correia on 21/07/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    var onRegister:(() -> Void)?
    var onLoginSuccess:(() -> Void)?
    
    lazy var screen: LoginScreen = {
        let screen = LoginScreen(frame: .zero)
        
        screen.onRegisterTapped = {
            self.onRegister?()
        }
        
        screen.onLoginTapped = {[weak self] email, password in
            self?.loginButtonTapped(email, password)
        }
        return screen
    }()
    
    override func loadView() {
        self.view = screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func loginButtonTapped(_ email: String, _ password: String) {
        let userViewModel = UserViewModel()
        userViewModel.getUserFromApi(email, password) { result in
            switch result {
            case .success(_):
                self.onLoginSuccess?()
            case .failure(let error):
                self.showMessage(title: "Erro", message: "\(error.localizedDescription)")
            }
        }
    }
    
    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}
