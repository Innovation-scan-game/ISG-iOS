//
//  SessionManager.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 26/11/2022.
//

import Foundation

class SessionManager {
    private var signalRService: SignalRService?
    private var apiService = ApiService()
    private let defaults = UserDefaults.standard
    
    init(signalRService: SignalRService? = nil) {
        self.signalRService = signalRService
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
    
    func joinGame(id: Int, completion:@escaping (userDto) -> ()) {
        
    }
    
    func leaveGame(id: Int, completion:@escaping (userDto) -> ()) {
        
    }
    
    func createGame(completion:@escaping (lobbyResponseDto) -> ()) {
        if let token = defaults.string(forKey: "X-AUTHTOKEN") {
            let body: [String: AnyHashable] = [
                "Authorization": token
            ]
            
            apiService.postData(body: body, url: Constants.API_BASE_URL + "session/create", model: lobbyResponseDto.self) { data in

                do {
                    print(data.id)

                } catch {
                    print("Unable to Encode Note (\(error))")
                }
                
                completion(data)
                
            } failure: { error in
                print(error)
            }
        }
        
    }
    
    func startGame(id: Int, completion:@escaping (userDto) -> ()) {
        
    }
    
    func changeState(id: Int, completion:@escaping (userDto) -> ()) {
        
    }
    
    func sessionHistory(id: Int, completion:@escaping (userDto) -> ()) {
        
    }
    
    func testSession() {
        
    }
}
