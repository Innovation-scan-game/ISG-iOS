//
//  ConnectionDelegation.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 05/01/2023.
//

import Foundation
import SignalRClient

class ConnectionDelegation: HubConnectionDelegate {
    private let apiService = ApiService()
    @Published var isReconnecting: Bool = false
    
    func connectionDidReconnect() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            if let connectionId = UserDefaults.standard.string(forKey: "connectionId") {
                let body: [String: AnyHashable] = [
                    "connectionId": connectionId,
                ]

                self.apiService.httpRequestWithoutReturn(body: body, url: "joinGrp", httpMethod: "POST")
                self.isReconnecting = false
                print("Connection did reconnect")
            }
        }
    }
    
    func connectionWillReconnect(error: Error) {
        print("Connection wil reconnect: \(error.localizedDescription)")
        self.isReconnecting = true
    }
    
    func connectionDidOpen(hubConnection: SignalRClient.HubConnection) {
        print("Connection did open")
    }
    
    func connectionDidFailToOpen(error: Error) {
        print("Connection failed to open")
    }
    
    func connectionDidClose(error: Error?) {
        print("Connection did close?")
    }
    
    func didReceiveData(data: Data) {
        print("We did receive any data")
    }

}
