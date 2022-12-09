//
//  SessionViewModel.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 26/11/2022.
//

import Foundation
import SignalRClient

class SessionViewModel: ObservableObject {
    private let sessionManager = SessionManager()
    @Published var joinGameIsLoading: Bool = false
    @Published var hostGameIsLoading: Bool = false
    @Published var howToPlayIsLoading: Bool = false
    @Published var accountSettingsIsLoading: Bool = false
    
    func submitSession() {
        //..
    }
    
    func sendChatMessage() {
        //..
    }
    
    func nextRound() {
        //..
    }
    
    func endGame() {
        //..
    }
    
    func joinGame() {
        //..
    }
    
    func leaveGame() {
        //..
    }
    
    func createGame() {
        sessionManager.createGame() { data in
            print (data)
        }
    }
    
    func startGame() {
        //..
    }
    
    func changeState() {
        //..
    }
    
    func sessionHistory() {
        //..
    }
}
