//
//  MainMenuViewModel.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 09/12/2022.
//

import Foundation

class MainMenuViewModel: ObservableObject {
    private let sessionManager = SessionManager()
    private let userManager = UserManager()
    
    @Published var hostGameIsLoading: Bool = false
    @Published var sessionCreated: Bool = false
    @Published var logOffIsLoading: Bool = false
    @Published var isLoggedOff: Bool = false
    
    func hostGame() {
        self.hostGameIsLoading = true
        
        //execute code
        sessionManager.createGame() { data in
            print (data)
        }
        self.hostGameIsLoading = false
        self.sessionCreated = true
    }
    
    func logOff() {
        self.logOffIsLoading = true
        userManager.logoffUser()
        self.isLoggedOff = true
        self.logOffIsLoading = false
    }
}
