//
//  LoginManager.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 26/11/2022.
//

import Foundation

class AccountManager {
    private let apiService = ApiService()
    
    func loginUser(username: String, password: String, completion:@escaping (loginResponseDto?) -> ()) {
        let body: [String: AnyHashable] = [
            "username": username,
            "password": password
        ]
        
        apiService.httpRequest(body: body, url: "login", model: loginResponseDto.self, httpMethod: "POST") { data in
            
            UserDefaults.standard.set(data.accessToken, forKey: "X-AUTHTOKEN")

            do {
                let encoder = JSONEncoder()
                let user = try encoder.encode(data.user)
                UserDefaults.standard.set(user, forKey: "user")
            } catch {
                print("Unable to Encode Note (\(error))")
            }
            
            completion(data)
            
        } failure: { error in
            completion(nil)
        }
    }
    
    func registerUser(username: String, password: String, emailadress: String, completion:@escaping (registerResponseDto?) -> ()) {
        let body: [String: AnyHashable] = [
            "username": username,
            "password": password,
            "email": emailadress
        ]
        
        apiService.httpRequest(body: body, url: "user", model: registerResponseDto.self, httpMethod: "POST") { data in
            print(data)
            completion(data)
            
        } failure: { error in
            completion(nil)
        }
    }
}
