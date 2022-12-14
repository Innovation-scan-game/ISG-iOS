//
//  SessionViewModel.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 26/11/2022.
//

import Foundation
import SignalRClient

class GameViewModel: ObservableObject {
    
    private let gameManager = GameManager()
    private var isLoading = false
    @Published var lobbyResponseDto: lobbyResponseDto?
    @Published var gameId = ""
    @Published var joinSucceed = false
    @Published var amountSelected = 0
    
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
                self.lobbyResponseDto = data
                self.joinSucceed = true
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
            if let lobbyResponseDto = self.lobbyResponseDto {
                self.gameManager.changeState(state: lobbyResponseDto.players[0].ready)
            }
        }
    }
}
