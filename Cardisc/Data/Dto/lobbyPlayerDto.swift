//
//  lobbyPlayerDto.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 25/11/2022.
//

import Foundation

struct lobbyPlayerDto: Decodable, Identifiable {
    let ready: Bool
    let id: String
    let username: String
    let email: String
    let role: String
    let picture: String
    
    enum CodingKeys: String, CodingKey  {
        case ready = "ready"
        case id = "id"
        case username = "username"
        case email = "email"
        case role = "role"
        case picture = "picture"
    }
    
    func ToDomainModel() -> LobbyPlayer {
        return LobbyPlayer(ready: self.ready, id: self.id, username: self.username, email: self.email, role: self.role, picture: self.picture)
    }
}


