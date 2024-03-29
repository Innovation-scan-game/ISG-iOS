//
//  PlayerList.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 10/12/2022.
//

import Foundation
import SwiftUI

struct PlayerList: View {
    
    var players: [LobbyPlayer]
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("host_menu_title_2").bold(true)
                    Spacer()
                    Text("host_menu_title_3").bold(true)
                }
                .foregroundColor(Color.black)
                .padding(.horizontal, 15)
                .padding(.top, 10)
                
                Divider().frame(height: 1).foregroundColor(Color.black).padding(.horizontal, 10)
                
                ScrollView(.vertical) {
                    ForEach(players) { player in
                        PlayerItem(player: player)
                    }
                }

            }
            .frame(maxWidth: .infinity)
            .frame(maxHeight: 350, alignment: .top)
            .background(Color.white)
            .cornerRadius(10, corners: [.allCorners])
            .padding(.vertical, 5)
            .shadow(radius: 5)
        }
    }
}
