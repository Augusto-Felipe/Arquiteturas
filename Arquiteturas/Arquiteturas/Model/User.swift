//
//  User.swift
//  Arquiteturas
//
//  Created by Felipe Augusto Correia on 17/07/23.
//

import Foundation

struct User: Codable {
    let email: String
    let password: String
    
    init() {
        self.email = String()
        self.password = String()
    }
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
