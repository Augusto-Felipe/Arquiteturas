//
//  HomeViewController.swift
//  Arquiteturas
//
//  Created by Felipe Augusto Correia on 21/07/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    private lazy var screen: HomeScreen = {
        let screen = HomeScreen()
        screen.translatesAutoresizingMaskIntoConstraints = false
        return screen
    }()
    
    override func loadView() {
        screen = HomeScreen()
        self.view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
