//
//  CardManager.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 20/11/2022.
//

import Foundation

class CardManager {
    let defaults = UserDefaults.standard
    
    func getCards(id: Int, completion:@escaping (userDto) -> ()) {
        Bundle.main.fetchData( url: Constants.API_BASE_URL + "users/\(id)", model: userDto.self) { data in
            completion(data)
        } failure: { error in
            print(error)
        }
    }
    
    func getCardById(id: Int, completion:@escaping (userDto) -> ()) {
        Bundle.main.fetchData( url: Constants.API_BASE_URL + "users/\(id)", model: userDto.self) { data in
            completion(data)
        } failure: { error in
            print(error)
        }
    }
}
