//
//  Coordinator.swift
//  Arquiteturas
//
//  Created by Felipe Augusto Correia on 21/07/23.
//

import Foundation
import UIKit

protocol CoordinatorProtocol {
    var navigationController: UINavigationController { get }
    
    func start()
    
    init(navigationController: UINavigationController)
}

