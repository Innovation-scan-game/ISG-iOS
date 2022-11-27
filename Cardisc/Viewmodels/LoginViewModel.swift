//
//  LoginViewModel.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 26/11/2022.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    private let loginManager = LoginManager()
    
    func loginUser(username: String, password: String) -> Bool {
        var loggedIn = false
        
        loginManager.loginUser(username: username, password: password) { data in
            print (data)
            loggedIn = true
            
        }
        sleep(1)
        return loggedIn
    }
    
    func registerUser(username: String, password: String, email: String) -> Bool {
        var registered = false
        
        loginManager.registerUser(username: username, password: password, emailadress: email) { data in
            print (data)
            registered = true
            
        }
        sleep(1)
        return registered
    }
    
}
