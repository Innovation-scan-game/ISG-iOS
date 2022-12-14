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
        DispatchQueue.main.async {
            if(self.gameId != self.lobbyResponseDto?.sessionAuth) {
                self.gameManager.joinGame(sessionAuth: self.gameId) { data in
                    self.lobbyResponseDto = data
                    self.joinSucceed = true
                }
            }
            else {
                print("Can not join own hosted session")
            }
        }
    }
    
    func leaveGame() {
        DispatchQueue.main.async {
            self.gameManager.leaveGame(sessionAuth: self.gameId) { data in
                self.lobbyResponseDto = nil
            }
        }
    }
    
    func createGame() {
        DispatchQueue.main.async {
            self.gameManager.createGame() { data in
                self.lobbyResponseDto = data
            }
        }
    }
    
    func startGame() {
        //..
    }
    
    func changeState() {
//        DispatchQueue.main.async {
//            self.gameManager.changeState(id: <#T##Int#>, completion: <#T##(userDto) -> ()#>) { data in
//                self.lobbyResponseDto = data
//            }
//        }
        
    }
    
    func sessionHistory() {
        //..
    }
}
