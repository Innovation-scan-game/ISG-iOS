//
//  UserManager.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 20/11/2022.
//

import Foundation

class UserManager {
    let defaults = UserDefaults()
    
    func logoffUser() {
        self.defaults.removeObject(forKey: "X-AUTHTOKEN")
        self.defaults.removeObject(forKey: "USERID")
    }
    
    func getUserById(id: Int, completion:@escaping (userDto) -> ()) {
        Bundle.main.fetchData( url: Constants.API_BASE_URL + "users/\(id)", model: userDto.self) { data in
            completion(data)
        } failure: { error in
            print(error)
        }
    }
    
    func deleteUserById(id: Int, completion:@escaping (userDto) -> ()) {
        Bundle.main.fetchData( url: Constants.API_BASE_URL + "users/\(id)", model: userDto.self) { data in
            completion(data)
        } failure: { error in
            print(error)
        }
    }
    
    func createNewUser(id: Int, completion:@escaping (userDto) -> ()) {
        Bundle.main.fetchData( url: Constants.API_BASE_URL + "users/\(id)", model: userDto.self) { data in
            completion(data)
        } failure: { error in
            print(error)
        }
    }
    
    func updateUser(id: Int, completion:@escaping (userDto) -> ()) {
        Bundle.main.fetchData( url: Constants.API_BASE_URL + "users/\(id)", model: userDto.self) { data in
            completion(data)
        } failure: { error in
            print(error)
        }
    }
    
    func uploadAvatar(id: Int, completion:@escaping (userDto) -> ()) {
        Bundle.main.fetchData( url: Constants.API_BASE_URL + "users/\(id)", model: userDto.self) { data in
            completion(data)
        } failure: { error in
            print(error)
        }
    }
    
    
}

