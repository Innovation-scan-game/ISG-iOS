//
//  SignalR.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 04/12/2022.
//

import Foundation
import SignalRClient

class SignalRService {
    private var connection: HubConnection
    private var apiService = ApiService()
    private var connectionId = ""
    
    @Published var players: [lobbyPlayerDto]?
    
    public init(url: URL) {
        
        let defaults = UserDefaults.standard;
        
        // has to be created after logging in
        connection = HubConnectionBuilder(url: url)
            .withLogging(minLogLevel: .error)
            .build()
        
        connection.on(method: "newConnection", callback: {
            (id: String) in
            print("NEW CONNECTION ACTION PERFORMED")
            self.connectionId = id
            //perform action
        })
        
        connection.on(method: "readyStateChanged", callback: {
            (player: lobbyPlayerDto) in
            print("READY STATE CHANGE ACTION PERFORMED")
            self.onReadyStateChange(player: player)
        })
        
        connection.on(method: "newPlayer", callback: {
            (player: lobbyPlayerDto) in
            print("NEW PLAYER IN THE ROOM")
            self.onNewPlayer(player: player)
        })
        
        connection.on(method: "playerLeft", callback: {
            print("PLAYER LEFT ACTION PERFORMED")
        })
        
        connection.on(method: "startGame", callback: {
            print("START GAME ACTION PERFORMED")
            //Method te perform
        })
        
        connection.on(method: "newMessage", callback: {
            print("NEW MESSAGE ACTION PERFORMED")
            //Method te perform
        })
        
        connection.on(method: "newAnswer", callback: {
            print("NEW ANSWER ACTION PERFORMED")
            //Method te perform
        })
        
        connection.on(method: "nextRound", callback: {
            print("NEXT ROUND ACTION PERFORMED")
            //Method te perform
        })
        
        connection.on(method: "endSession", callback: {
            print("END SESSION ACTION PERFORMED")
            //Method te perform
        })
        connection.on(method: "close", callback: {
            print("CONN CLOSED")
            //Method te perform
        })
        connection.start()
    }
    
    
    public func joinMessageGroup() {
        let body: [String: AnyHashable] = [
            "connectionId": self.connectionId,
        ]

        apiService.postDataWithoutReturn(body: body, url: Constants.API_BASE_URL + "joinGrp")
    }

    
    private func onNewConnection(id: String) {
        //..
    }
    
    private func onClose() {
//      console.log("connection closed")
//      store.setConnectionId("");
//      store.setConnection(null);
    }
    
    private func  onReadyStateChange(player: lobbyPlayerDto) {
        print("hoioidoaijdoahjckja")
        for var p in self.players ?? [] {
            if(p.id == player.id) {
                p.ready.toggle()
            }
        }
    }
    
    private func  onNewPlayer(player: lobbyPlayerDto) {
        //is there a better way?
        var contains = false
        for p in self.players ?? [] {
            if(player.id == p.id) {
                contains = true
                break
            }
        }
        if(!contains) {
            self.players?.append(player)
        }
        
    }
    
    private func  onPlayerLeft(player: String) {
//      console.log("store sess", store.sessionInfo)
//      if (player.id === store.sessionInfo.hostId || player.id === store.user.id) {
//        store.resetState();
//      }
//      store.removePlayer(player);
    }
    
    private func  onGameStarted(gameInfo: String) {
//      console.log("GAME STARTED")
//      gameInfo.rounds = gameInfo.cards.length;
//      gameInfo.currentRound = 0;
//      store.setGameState("game");
//      store.setGameInfo(gameInfo);
    }
    
    private func  onNewMessage(user: userDto, cardIndex: Int, message: String) {
//      store.addMessage({ user: user, message: message, round: cardIndex });
    }
    
    private func  onNewAnswer(user: userDto, answer: submitAnswerDto) {
//      console.log("OnNewAnswer", user, answer)
//      store.addAnswer({ user: user, answer: answer });
    }
    
    private func  onNextRound() {
//      store.setAnswers([]);
//      store.setAnswerSubmitted(false);
//      store.setConclusion("");
//      store.increaseRound();
    }
    
    private func onEndSession() {
//      console.log("onEndSession")
//      store.resetState();
//      store.setGameState('end');
    }
}
