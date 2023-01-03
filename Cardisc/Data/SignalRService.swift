//
//  SignalR.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 04/12/2022.
//

import Foundation
import SignalRClient
import Combine
import SwiftUI

class SignalRService: ObservableObject {
    //SignalR variables
    private let defaults = UserDefaults.standard
    private var connection: HubConnection
    private var connectionDelegation = ConnectionDelegation()
    private var apiService = ApiService()
    private var connectionId = ""
    
    //Game variables, these change on the actions of any user in the session
    @Published var players: [LobbyPlayer] = []
    @Published var game: Game = Game(cards: [], roundDuration: 0)
    @Published var answers: [Answer] = []
    @Published var chatMessages: [ChatMessage] = []
    @Published var gameIndex: Int = 0
    
    public init() {
        self.connection = HubConnectionBuilder(url: URL(string: Constants.SIGNALR_BASE_URL + defaults.string(forKey: "X-AUTHTOKEN")!)!)
            .withHubConnectionDelegate(delegate: self.connectionDelegation)
            .withLogging(minLogLevel: .error)
            .withAutoReconnect()
            .build()
        
        connection.on(method: "newConnection", callback: {
            (id: String) in
            print("NEW CONNECTION ACTION PERFORMED")
            self.defaults.set(id, forKey: "connectionId")
            self.connectionId = id
        })
        
        connection.on(method: "readyStateChanged", callback: {
            (player: lobbyPlayerDto) in
            print("READY STATE CHANGE ACTION PERFORMED")
            self.onReadyStateChange(player: player.toDomainModel())
        })
        
        connection.on(method: "newPlayer", callback: {
            (player: lobbyPlayerDto) in
            print("NEW PLAYER IN THE ROOM")
            self.onNewPlayer(player: player.toDomainModel())
        })
        
        connection.on(method: "playerLeft", callback: {
            (player: playerLeftDto) in
            print("PLAYER LEFT ACTION PERFORMED")
            self.onPlayerLeft(player: player)
        })
        
        connection.on(method: "startGame", callback: {
            (game: startGameDto) in
            print("START GAME ACTION PERFORMED")
            self.onGameStarted(game: game.toDomainModel())
        })
        
        connection.on(method: "newMessage", callback: {
            (user: userDto, cardIndex: Int, message: String) in
            print("NEW MESSAGE ACTION PERFORMED")
            self.onNewMessage(user: user.toDomainModel(), cardIndex: cardIndex, message: message)
        })
        
        connection.on(method: "newAnswer", callback: {
            (user: userDto, answer: String) in
            print("NEW ANSWER ACTION PERFORMED")
            self.onNewAnswer(user: user.toDomainModel(), answer: answer)
        })
        
        connection.on(method: "nextRound", callback: {
            print("NEXT ROUND ACTION PERFORMED")
            self.onNextRound()
        })
        
        connection.on(method: "endSession", callback: {
            print("END SESSION ACTION PERFORMED")
            self.onEndSession()
        })
        
        connection.on(method: "close", callback: {
            print("CONN CLOSED")
        })

        connection.start()
    }
    
    public func stopConnection() {
        self.connection.stop()
    }
    
    public func joinMessageGroup() {
        let body: [String: AnyHashable] = [
            "connectionId": self.connectionId,
        ]

        apiService.httpRequestWithoutReturn(body: body, url: "joinGrp", httpMethod: "POST")
    }
    
    private func onReadyStateChange(player: LobbyPlayer) {
        var index = 0
        for p in self.players {
            if(p.username == player.username) {
                self.players[index].ready.toggle()
            }
            index+=1
        }
    }
    
    private func onNewPlayer(player: LobbyPlayer) {
        if(!players.contains(where: { $0.username == player.username })) {
            self.players.append(player)
        }
    }
    
    private func onPlayerLeft(player: playerLeftDto) {
        var index = 0
        for p in self.players {
            if(p.username == player.name) {
                self.players.remove(at: index)
                index+=1
            }
        }
    }
    
    private func onGameStarted(game: Game) {
        self.game = game
    }
    
    private func onNewMessage(user: User, cardIndex: Int, message: String) {
        if(!chatMessages.contains(where: { $0.message == message })) {
            self.chatMessages.append(ChatMessage(username: user.username, message: message))
        }
    }
    
    private func onNewAnswer(user: User, answer: String) {
        self.answers.append(Answer(id: user.id, username: user.username, answer: answer))
    }
    
    private func onNextRound() {
        if(game.cards.count > 0) {
            self.gameIndex += 1
            self.answers = []
            self.chatMessages = []
        }
    }
    
    private func onEndSession() {
        self.game = Game(cards: [], roundDuration: 0)
        self.gameIndex += 1
    }
}

class ConnectionDelegation: HubConnectionDelegate {
    private let apiService = ApiService()
    
    func connectionDidOpen(hubConnection: SignalRClient.HubConnection) {
        //..
    }
    
    func connectionDidReconnect() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let body: [String: AnyHashable] = [
                "connectionId": UserDefaults.standard.string(forKey: "connectionId"),
            ]

            self.apiService.httpRequestWithoutReturn(body: body, url: "joinGrp", httpMethod: "POST")
        }
    }
    
    func connectionWillReconnect(error: Error) {
        //..
    }
    
    func connectionDidFailToOpen(error: Error) {
        //..
    }
    
    func connectionDidClose(error: Error?) {
        //..
    }
    
    func didReceiveData(data: Data) {
        //..
    }

}

