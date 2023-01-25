//
//  LoginViewModel.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 26/11/2022.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    
    private let accountManager = AccountManager()
    
    @Published var username: String = ""
    @Published var usernameFieldColor = UIColor.black
    @Published var password: String = ""
    @Published var passwordFieldColor = UIColor.black
    @Published var loggedIn: Bool = false
    @Published var isRequestInProgress: Bool = false
    @Published var errorMessage: String = ""
    
    func loginUser() {
        self.isRequestInProgress = true
        DispatchQueue.main.async {
            if(!self.username.isEmpty) {
                if(!self.password.isEmpty) {
                    self.accountManager.loginUser(username: self.username, password: self.password) { data in
                        if (data != nil) {
                            self.isRequestInProgress = false
                            self.loggedIn = true
                            self.errorMessage = ""
                        }
                        else {
                            self.isRequestInProgress = false
                            self.errorMessage = "login_error_1".localized()
                        }
                        
                    }
                }
                else {
                    self.errorMessage = "login_error_2".localized()
                    self.isRequestInProgress = false
                }
            }
            else {
                self.errorMessage = "login_error_3".localized()
                self.isRequestInProgress = false
            }

        }
    }
}
