//
//  lobbyPlayerDto.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 25/11/2022.
//

import Foundation

struct lobbyResponseDto: Decodable {
    let id: String
    let hostId: String
    let sessionCode: String
    let created: String
    let sessionAuth: String
    let players: [lobbyPlayerDto]
    
    enum CodingKeys: String, CodingKey  {
        case id = "id"
        case hostId = "hostId"
        case sessionCode = "sessionCode"
        case created = "created"
        case sessionAuth = "sessionAuth"
        case players = "players"
    }
}
