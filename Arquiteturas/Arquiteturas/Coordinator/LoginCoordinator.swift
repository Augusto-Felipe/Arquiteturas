//
//  LoginCoordinator.swift
//  Arquiteturas
//
//  Created by Felipe Augusto Correia on 21/07/23.
//

import Foundation
import UIKit

class LoginCoordinator: CoordinatorProtocol {
    var navigationController: UINavigationController
    
    func start() {
        let viewController = LoginViewController()
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}
