//
//  LoginPresenter.swift
//  Arquiteturas
//
//  Created by Felipe Augusto Correia on 20/07/23.
//

import Foundation
import UIKit

protocol LoginPresenterProtocol {
    func showMessage(title: String, message: String)
    func goHome()
}

class LoginPresenter {
    var delegate: LoginPresenterProtocol?
    
    func login(user: User) {
        let manager = UserManager(business: UserBusiness())
        manager.login(email: user.email, password: user.password) { user in
            self.delegate?.goHome()
        } failureHandler: { error in
            self.delegate?.showMessage(title: "Erro", message: "\(error.localizedDescription)")
        }
    }
    
    func goHome() {
        self.delegate?.goHome()
    }
}
