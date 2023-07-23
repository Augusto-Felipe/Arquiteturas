//
//  LoginWorker.swift
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

class LoginWorker
{
    func login(user: User, successHandler: @escaping(User?) -> Void, failureHandler: @escaping(Error?) -> Void)
  {
      let manager = UserManager(business: UserBusiness())
      manager.login(email: user.email, password: user.password) { user in
          successHandler(user)
      } failureHandler: { error in
          failureHandler(error)
      }
      
  }
}
