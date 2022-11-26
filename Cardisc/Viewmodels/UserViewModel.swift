//
//  UserViewModel.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 26/11/2022.
//

import Foundation

class UserViewModel: ObservableObject {
    let userManager = UserManager()
    
    func logoffUser() {
        userManager.logoffUser()
    }
    
    func getUserById() {
        //..
    }
    
    func deleteUserById() {
        //..
    }
    
    func createNewUser() {
        //..
    }
    
    func updateUser() {
        //..
    }
    
    func uploadAvatar() {
        //..
    }
    
    func getInfo(userDefaults: String) -> String {
        if let info = userManager.defaults.string(forKey: userDefaults) {
            return info
        }
        return ""
    }
}

