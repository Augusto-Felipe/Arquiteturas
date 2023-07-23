//
//  LoginPresenter.swift
//  Arquiteturas
//
//  Created by Felipe Augusto Correia on 23/07/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol LoginPresentationLogic
{
    func presentSomething(response: Login.Something.Response)
    func presentError(error: Login.Something.ViewError)
}

class LoginPresenter: LoginPresentationLogic
{
    
    weak var viewController: LoginDisplayLogic?
    
    // MARK: Do something
    
    func presentSomething(response: Login.Something.Response)
    {
        let viewModel = Login.Something.ViewModel(user: response.user)
        viewController?.displaySomething(viewModel: viewModel)
    }
    
    func presentError(error: Login.Something.ViewError) {
        let viewError = Login.Something.ViewError(error: error as! Error)
        viewController?.displayError(error: viewError)
    }
    
}
