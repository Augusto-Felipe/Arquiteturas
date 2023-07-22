//
//  UserViewModel.swift
//  Arquiteturas
//
//  Created by Felipe Augusto Correia on 21/07/23.
//

import Foundation

class UserViewModel {
    private let model: User
    
    init(model: User) {
        self.model = model
    }
    
    init() {
        self.model = User()
    }
    
    var email: String {
        model.email
    }
    
    public func getUserFromApi (_ email: String, _ password: String, completion: @escaping(Result<UserViewModel, Error>) -> Void) {
        let manager = UserManager(business: UserBusiness())
        manager.login(email: email, password: password) { user in
            completion(.success(UserViewModel(model: user)))
        } failureHandler: { error in
            completion(.failure(error))
        }
    }
    
    public func setUserFromApi (_ email: String, _ password: String, completion: @escaping(Result<UserViewModel, Error>) -> Void) {
        let manager = UserManager(business: UserBusiness())
        manager.register(email: email, password: password) { user in
            completion(.success(UserViewModel(model: user)))
        } failureHandler: { error in
            completion(.failure(error))
        }
    }
}
