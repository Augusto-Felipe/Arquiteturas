//
//  RegisterViewController.swift
//  Arquiteturas
//
//  Created by Felipe Augusto Correia on 21/07/23.
//

import UIKit

class RegisterViewController: UIViewController {
    
    var login:(() -> Void)?
    var registerSuccess:(() -> Void)?
    
    private lazy var screen: RegisterScreen = {
        let screen = RegisterScreen(frame: .zero)
        
        screen.onLoginTapped = {[weak self] in
            self?.login?()
        }
        
        screen.onRegisterTapped = {[weak self] email, password in
            self?.registerTapped(email, password)
        }
        
        return screen
    }()
    
    override func loadView() {
        self.view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    //MARK: - Actions
    private func registerTapped(_ email: String, _ password: String) {
        let userViewModel = UserViewModel()
        userViewModel.setUserFromApi(email, password) {[weak self] result in
            switch result {
            case .success(_):
                self?.registerSuccess?()
            case.failure(let error):
                self?.showMessage(title: "Erro", message: "\(error.localizedDescription)")
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
