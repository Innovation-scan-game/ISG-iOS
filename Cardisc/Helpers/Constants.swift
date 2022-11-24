//
//  Constants.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 20/11/2022.
//

import Foundation

class Constants {
    static let API_POKEMONAMOUNT = 600
    static let API_BASE_URL = "https://pokeapi.co/api/v2/"
    static let API_FETCHPOKEMON = "https://pokeapi.co/api/v2/pokemon?limit=\(API_POKEMONAMOUNT)"
    static let API_DETAIL_URL = API_BASE_URL + "pokemon/"
    static let API_FRONTIMAGE_BASE = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/"
}

