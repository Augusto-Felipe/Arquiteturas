//
//  HomeCoordinator.swift
//  Arquiteturas
//
//  Created by Felipe Augusto Correia on 21/07/23.
//

import Foundation
import UIKit

class HomeCoordinator: CoordinatorProtocol {
    var navigationController: UINavigationController
    
    func start() {
        
    }
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
}
