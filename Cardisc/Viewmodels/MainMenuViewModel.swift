//
//  MainMenuViewModel.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 09/12/2022.
//

import Foundation

class MainMenuViewModel: ObservableObject {
    private let userManager = UserManager()
    @Published var gameViewModel = GameViewModel()
    
    @Published var hostGameIsLoading: Bool = false
    @Published var sessionCreated: Bool = false
    @Published var logOffIsLoading: Bool = false
    @Published var isLoggedOff: Bool = false
    
    func logOff() {
        self.logOffIsLoading = true
        userManager.logoffUser()
        self.isLoggedOff = true
        self.logOffIsLoading = false
    }
    
    func resetButtonStates() {
        isLoggedOff = false
        sessionCreated = false
    }
    
    func hostGame() -> GameViewModel {
        if(!sessionCreated) {
            DispatchQueue.main.async {
                print("hostGame")
                self.gameViewModel.createGame()
                self.sessionCreated = true
            }
        }
        return self.gameViewModel
    }
}
