//
//  UserBusiness.swift
//  Arquiteturas
//
//  Created by Felipe Augusto Correia on 18/07/23.
//

import Foundation

protocol UserBusinessProtocol {
    func register(email: String, password: String, completionHandler: @escaping(Result<User, Error>) -> Void)
    func login(email: String, password: String, completionHandler: @escaping(Result<User, Error>) -> Void)
}

class UserBusiness: UserBusinessProtocol {
    let provider: UserProvider = UserProvider()
    
    func login(email: String, password: String, completionHandler: @escaping (Result<User, Error>) -> Void) {
        provider.login(parameters: getParams(email, password)) { result in
            switch result {
                
            case .success(let userModel):
                completionHandler(.success(userModel))
                
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    func register(email: String, password: String, completionHandler: @escaping (Result<User, Error>) -> Void) {
        provider.register(parameters: getParams(email, password)) { result in
            switch result {
                
            case .success(let userModel):
                completionHandler(.success(userModel))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    private func getParams(_ email: String, _ password: String) -> [AnyHashable: Any] {
        let userModel = User(email: email, password: password)
        let params: [AnyHashable: Any] = [Constants.ParametersKeys.body: [Constants.ParametersKeys.user: userModel]]
        
        return params
    }
}
