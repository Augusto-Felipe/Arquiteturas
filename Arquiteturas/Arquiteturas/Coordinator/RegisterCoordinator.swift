//
//  RegisterCoordinator.swift
//  Arquiteturas
//
//  Created by Felipe Augusto Correia on 21/07/23.
//

import Foundation
import UIKit

class RegisterCoordinator: CoordinatorProtocol {
    var navigationController: UINavigationController
    
    func start() {
        let viewController = RegisterViewController()
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}
