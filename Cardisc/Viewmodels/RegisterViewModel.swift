//
//  RegisterViewModel.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 10/12/2022.
//

import Foundation

class RegisterViewModel: ObservableObject {
    
    private let accountManager = AccountManager()
    
    @Published var username: String = ""
    @Published var emailaddress: String = ""
    @Published var password: String = ""
    @Published var passwordRepeated: String = ""
    @Published var userRegistered: Bool = false
    @Published var errorMsg: String = ""
    @Published var showSucceedMessage: Bool = false
    
    func registerUser() {
        DispatchQueue.main.async {
            if(!self.username.isEmpty && !self.emailaddress.isEmpty && !self.password.isEmpty && !self.passwordRepeated.isEmpty) {
                let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
                let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
                if emailTest.evaluate(with: self.emailaddress) {
                    if(self.password == self.passwordRepeated) {
                        if(self.password.count > 4) {
                            self.accountManager.registerUser(username: self.username, password: self.password, emailadress: self.emailaddress) { data in
                                if (data != nil) {
                                    self.userRegistered = true
                                    self.errorMsg = ""
                                }
                                else {
                                    self.errorMsg = "register_error_1"
                                }
                            }
                        }
                        else {
                            self.errorMsg = "register_error_2"
                        }
                        
                    }
                    else {
                        self.errorMsg = "Passwords aren't matching"
                    }
                }
                else {
                    self.errorMsg = "Emailadres incorrect"
                }
                
            }
            else {
                self.errorMsg = "Some fields are empty"
            }
            
        }
    }
}
