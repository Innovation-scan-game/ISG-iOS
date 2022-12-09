//
//  SignalR.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 04/12/2022.
//

import Foundation
import SignalRClient

public class SignalRService {
    private var connection: HubConnection
    
    public init(url: URL) {
        // has to be created after logging in
        connection = HubConnectionBuilder(url: url)
            .withLogging(minLogLevel: .error)
            .build()
        
        connection.on(method: "newConnection", callback: {
            (id: String) in
            print("NEW CONNECTION ACTION PERFORMED")
            self.onNewConnection(id: id)
        })
        
        connection.on(method: "readyStateChange", callback: {
            (user: userDto) in
            //JUREK: what is the return type of these functions? Do they even return something?
            print("READY STATE CHANGE ACTION PERFORMED")
            self.onNewConnection(id: "")
        })
        
        connection.on(method: "newPlayer", callback: {
            print("NEW PLAYER ACTION PERFORMED")
            //Method to perform
        })
        
        connection.on(method: "playerLeft", callback: {
            print("PLAYER LEFT ACTION PERFORMED")
            //Method te perform
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
        
        connection.start()
    }
    
    private func onNewConnection(id: String) {
        print (id)
    }
    
    private func onClose() {
//      console.log("connection closed")
//      store.setConnectionId("");
//      store.setConnection(null);
    }
    
    private func  onReadyStateChange(user: userDto) {
//      console.log("onReadyStateChange", user)
//      store.updatePlayer(user);
    }
    
    private func  onNewPlayer(player: String) {
//      store.addPlayer(player);
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
