//
//  SessionManager.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 26/11/2022.
//

import Foundation

class SessionManager {
    let defaults = UserDefaults.standard
    
    func submitSession(id: Int, completion:@escaping (userDto) -> ()) {
        Bundle.main.fetchData( url: Constants.API_BASE_URL + "users/\(id)", model: userDto.self) { data in
            completion(data)
        } failure: { error in
            print(error)
        }
    }
    
    func sendChatMessage(id: Int, completion:@escaping (userDto) -> ()) {
        Bundle.main.fetchData( url: Constants.API_BASE_URL + "users/\(id)", model: userDto.self) { data in
            completion(data)
        } failure: { error in
            print(error)
        }
    }
    
    func nextRound(id: Int, completion:@escaping (userDto) -> ()) {
        Bundle.main.fetchData( url: Constants.API_BASE_URL + "users/\(id)", model: userDto.self) { data in
            completion(data)
        } failure: { error in
            print(error)
        }
    }
    
    func endGame(id: Int, completion:@escaping (userDto) -> ()) {
        Bundle.main.fetchData( url: Constants.API_BASE_URL + "users/\(id)", model: userDto.self) { data in
            completion(data)
        } failure: { error in
            print(error)
        }
    }
    
    func joinGame(id: Int, completion:@escaping (userDto) -> ()) {
        Bundle.main.fetchData( url: Constants.API_BASE_URL + "users/\(id)", model: userDto.self) { data in
            completion(data)
        } failure: { error in
            print(error)
        }
    }
    
    func leaveGame(id: Int, completion:@escaping (userDto) -> ()) {
        Bundle.main.fetchData( url: Constants.API_BASE_URL + "users/\(id)", model: userDto.self) { data in
            completion(data)
        } failure: { error in
            print(error)
        }
    }
    
    func createGame(id: Int, completion:@escaping (userDto) -> ()) {
        Bundle.main.fetchData( url: Constants.API_BASE_URL + "users/\(id)", model: userDto.self) { data in
            completion(data)
        } failure: { error in
            print(error)
        }
    }
    
    func startGame(id: Int, completion:@escaping (userDto) -> ()) {
        Bundle.main.fetchData( url: Constants.API_BASE_URL + "users/\(id)", model: userDto.self) { data in
            completion(data)
        } failure: { error in
            print(error)
        }
    }
    
    func changeState(id: Int, completion:@escaping (userDto) -> ()) {
        Bundle.main.fetchData( url: Constants.API_BASE_URL + "users/\(id)", model: userDto.self) { data in
            completion(data)
        } failure: { error in
            print(error)
        }
    }
    
    func sessionHistory(id: Int, completion:@escaping (userDto) -> ()) {
        Bundle.main.fetchData( url: Constants.API_BASE_URL + "users/\(id)", model: userDto.self) { data in
            completion(data)
        } failure: { error in
            print(error)
        }
    }
}
