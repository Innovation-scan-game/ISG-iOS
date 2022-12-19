//
//  SessionViewModel.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 26/11/2022.
//

import Foundation
import SignalRClient

class GameViewModel: ObservableObject {
    
    @Published var gameManager = GameManager()
    @Published var lobbyResponseDto: lobbyResponseDto?
    @Published var gameId = ""
    @Published var joinSucceed = false
    @Published var amountSelected = 0
    
    private var isLoading = false
    
    func submitSession() {
        //..
    }
    
    func sendChatMessage() {
        //..
    }
    
    func nextRound() {
        //..
    }
    
    func joinGame() {
        DispatchQueue.main.async {
            self.gameManager.joinGame(sessionAuth: self.gameId) { data in
                if(data.players != nil) {
                    self.joinSucceed = true
                    self.lobbyResponseDto = data
                }
                else {
                    print("NEEEEEE")
                }
            }
        }
        
    }
    
    func leaveGame() {
        DispatchQueue.main.async {
            self.gameManager.leaveGame(sessionAuth: self.gameId)
            self.lobbyResponseDto = nil
        }
    }
    
    func startGame() {
        DispatchQueue.main.async {
            self.gameManager.startGame()
        }
        print("START GAME METHOD VIEWMODEL")
    }
    
    func createGame() {
        DispatchQueue.main.async {
            self.gameManager.createGame() { data in
                self.lobbyResponseDto = data
            }
        }
    }
    
    func endSession() {
        DispatchQueue.main.async {
            self.gameManager.endGame()
        }
    }
    
    func changeState() {
        DispatchQueue.main.async {
            self.gameManager.changeState()
        }
    }
}
