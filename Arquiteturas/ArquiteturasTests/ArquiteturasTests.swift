//
//  ArquiteturasTests.swift
//  ArquiteturasTests
//
//  Created by Felipe Augusto Correia on 17/07/23.
//

import XCTest
@testable import Arquiteturas

final class ArquiteturasTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testRegister() {
        let manager = UserManager(business: UserBusiness())
        
        manager.register(email: "teste@teste.com", password: "123456") { user in
            print(user)
        } failureHandler: { error in
            print(error)
        }
        
        manager.register(email: "aaaaa", password: "a123456") { user in
            print(user)
        } failureHandler: { error in
            print(error)
        }
        
        manager.register(email: "teste@teste.com", password: "123456") { user in
            print(user)
        } failureHandler: { error in
            print(error)
        }
    }
    
    func testLogin() {
        let manager = UserManager(business: UserBusiness())
        
        manager.login(email: "aaa", password: "aaaaa") { result in
            switch result {
            case .success(let user):
                print(user)
            case .failure(let error):
                print(error)
            }
        }
        
        manager.login(email: "teste@teste.com", password: "aaaaa") { result in
            switch result {
            case .success(let user):
                print(user)
            case .failure(let error):
                print(error)
            }
        }
        
        manager.login(email: "teste@teste.com", password: "123456") { result in
            switch result {
            case .success(let user):
                print(user)
            case .failure(let error):
                print(error)
            }
        }
    }
}
