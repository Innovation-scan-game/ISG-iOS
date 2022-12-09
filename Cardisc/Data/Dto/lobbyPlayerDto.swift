//
//  lobbyPlayerDto.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 25/11/2022.
//

import Foundation

struct lobbyPlayerDto: Codable {
    let ready: Bool
    let id: String
    let username: String
    let email: String
    let role: String
    let picture: String
}
