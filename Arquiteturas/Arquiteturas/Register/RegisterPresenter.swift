//
//  RegisterPresenterViewController.swift
//  Arquiteturas
//
//  Created by Felipe Augusto Correia on 21/07/23.
//

import Foundation

protocol RegisterPresenterProtocol {
    func showMessage(title: String, message: String)
    func goHome()
}

class RegisterPresenter {
    
    var delegate: RegisterPresenterProtocol?
    
    func register(user: User) {
        let manager = UserManager(business: UserBusiness())

        manager.register(email: user.email, password: user.password) { user in
            self.delegate?.goHome()
        } failureHandler: { error in
            self.delegate?.showMessage(title: "Erro", message: "\(error.localizedDescription)")
        }
    }
    
    func goHome() {
        self.delegate?.goHome()
    }
}
