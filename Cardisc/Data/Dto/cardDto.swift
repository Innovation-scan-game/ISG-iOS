//
//  cardDto.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 25/11/2022.
//

import Foundation

struct cardDto: Codable {
    let id: String
    let cardNumber: Int
    let cardName: String
    let cardBody: String
    let type: Int
    let picture: String?
    
    func toDomainModel() -> Card {
        return Card(
            id: self.id,
            number: self.cardNumber,
            name: self.cardName,
            body: self.cardBody,
            type: self.type,
            picture: self.picture
        )
    }
}
