//
//  ViewController.swift
//  Arquiteturas
//
//  Created by Felipe Augusto Correia on 21/07/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    private lazy var screen: LoginScreen = {
        let screen = LoginScreen()
        screen.translatesAutoresizingMaskIntoConstraints = false
        return screen
    }()
    
    override func loadView() {
        screen = LoginScreen()
        view = screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
