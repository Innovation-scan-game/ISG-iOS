//
//  SessionManager.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 26/11/2022.
//

import Foundation

class GameManager {
    private var signalRService: SignalRService?
    private var apiService = ApiService()
    private let defaults = UserDefaults.standard
    
    init() {
        print("init")
        
        
        defaults.set([], forKey: "players")
        
        
        if let token = defaults.string(forKey: "X-AUTHTOKEN") {
            if let url = URL(string: Constants.SIGNALR_BASE_URL + token){
                self.signalRService = SignalRService(url: url)
            }
            else {
                print("incorrect url")
            }
        }
        else {
            print ("no key found")
        }
    }
    
    func submitSession(id: Int, completion:@escaping (userDto) -> ()) {
        
    }
    
    func sendChatMessage(id: Int, completion:@escaping (userDto) -> ()) {
        
    }
    
    func nextRound(id: Int, completion:@escaping (userDto) -> ()) {
        
    }
    
    func endGame(id: Int, completion:@escaping (userDto) -> ()) {
        
    }
    
    func joinGame(sessionAuth: String, completion:@escaping (lobbyResponseDto) -> ()) {
        print ("join")
        let body: [String: AnyHashable] = [
            "sessionAuth": sessionAuth
        ]
        
        if let token = defaults.string(forKey: "X-AUTHTOKEN") {
            apiService.postData(token: token, body: body, url: Constants.API_BASE_URL + "session/join", model: lobbyResponseDto.self) { data in
                completion(data)
            } failure: { error in
                print(error)
            }
        }
    }
    
    func leaveGame(sessionAuth: String, completion:@escaping (userDto) -> ()) {
        //        let body: [String: AnyHashable] = [
        //            "sessionAuth": sessionAuth
        //        ]
        //
        //        if let token = defaults.string(forKey: "X-AUTHTOKEN") {
        //            apiService.postData(token: token, body: body, url: Constants.API_BASE_URL + "session/leave") { data in
        //                completion(data)
        //            } failure: { error in
        //                print(error)
        //            }
        //        }
    }
    
    func createGame(completion:@escaping (lobbyResponseDto) -> ()) {
        print("create")
        if let token = defaults.string(forKey: "X-AUTHTOKEN") {
            
            apiService.postData(token: token, body: nil, url: Constants.API_BASE_URL + "session/create", model: lobbyResponseDto.self) { data in
                completion(data)
            } failure: { error in
                print(error)
            }
        }
        
    }
    
    func startGame(id: Int, completion:@escaping (userDto) -> ()) {
        
    }
    
    func changeState(id: Int, completion:@escaping (userDto) -> ()) {
        
//        let body: [String: AnyHashable] = [
//            "ready": true
//        ]
//        
//        if let token = defaults.string(forKey: "X-AUTHTOKEN") {
//            apiService.postData(token: token, body: nil, url: Constants.API_BASE_URL + "session/ready", model: lobbyResponseDto.self) { data in
//                completion(data)
//            } failure: { error in
//                print(error)
//            }
//        }
    }
    
    func sessionHistory(id: Int, completion:@escaping (userDto) -> ()) {
        
    }
    
    func testSession() {
        
    }
}
