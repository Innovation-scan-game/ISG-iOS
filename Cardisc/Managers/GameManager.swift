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
    private let leftSession = false
    
    init() {
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
    
    func endGame() {
        apiService.postDataWithoutReturn(body: nil, url: Constants.API_BASE_URL + "session/end")
    }
    
    func joinGame(sessionAuth: String, completion:@escaping (lobbyResponseDto) -> ()) {
        print ("join")
        let body: [String: AnyHashable] = [
            "sessionAuth": sessionAuth
        ]
        
        apiService.postData(body: body, url: Constants.API_BASE_URL + "session/join", model: lobbyResponseDto.self) { data in
            completion(data)
        } failure: { error in
            print(error)
        }
    }
    
    func leaveGame(sessionAuth: String) {
        let body: [String: AnyHashable] = [
            "sessionAuth": sessionAuth
        ]
        
        apiService.postDataWithoutReturn(body: body, url: Constants.API_BASE_URL + "session/leave")
        
    }
    
    func createGame(completion:@escaping (lobbyResponseDto) -> ()) {
        apiService.postData(body: nil, url: "\(Constants.API_BASE_URL)session/create", model: lobbyResponseDto.self) { data in
            completion(data)
            if let signalRService = self.signalRService {
                signalRService.joinMessageGroup()
            }
        } failure: { error in
            print(error)
        }
    }
    
    func startGame() {
        apiService.postDataWithoutReturn(body: nil, url: Constants.API_BASE_URL + "session/start")
    }
    
    func changeState(state: Bool) {
        let body: [String: AnyHashable] = [
            "ready": state
        ]
        apiService.postDataWithoutReturn(body: body, url: Constants.API_BASE_URL + "session/ready")
    }
}
