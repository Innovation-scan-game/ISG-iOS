//
//  lobbyPlayerDto.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 25/11/2022.
//

import Foundation

struct lobbyResponseDto: Codable {
    let id: String
    let hostId: String
    let session: String
    let created: String
    let sessionAuth: String
    let players: [lobbyPlayerDto]
}
