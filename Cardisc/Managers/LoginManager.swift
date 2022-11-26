//
//  LoginManager.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 26/11/2022.
//

import Foundation

class LoginManager {
    let defaults = UserDefaults.standard
    
    func loginUser(username: String, password: String, completion:@escaping (loginResponseDto) -> ()) {
        let body: [String: AnyHashable] = [
            "username": username,
            "password": password
        ]
        
        Bundle.main.postData(body: body, url: Constants.API_BASE_URL + "login", model: loginResponseDto.self) { data in
            self.defaults.set(data.accessToken, forKey: "X-AUTHTOKEN")
            self.defaults.set(data.user.id, forKey: "USERID")
            print(data.user.id)
            completion(data)
            
        } failure: { error in
            print(error)
        }
    }
}
