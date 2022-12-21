//
//  lobbyPlayerDto.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 25/11/2022.
//

import Foundation

class lobbyResponseDto: Identifiable, Decodable, ObservableObject {
    let id: String
    let hostId: String
    let sessionCode: String
    let created: String
    let sessionAuth: String
    let players: [lobbyPlayerDto]
}
