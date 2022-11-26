//
//  JoinGame.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 20/11/2022.
//

import Foundation
import SwiftUI

struct JoinGameView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            VStack{
                HStack {
                    Image(systemName: "person.fill.questionmark.rtl")
                        .resizable()
                        .frame(width: 30, height: 28)
                        .foregroundColor(Color.white)
                        .padding(.trailing, 5)
                    Text("Join a game").font(.system(size: 24)).foregroundColor(Color.white).bold()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                
                HStack {
                    Text("Join a game by entering the Game ID you received from the game host.").foregroundColor(Color(UIColor.white))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                
            }.padding(.horizontal, 30)
            VStack{
                HStack {
                    Text("Enter game id.").foregroundColor(Color(UIColor.white)).bold()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 20)
                
                HStack {
                    TextField(
                        "...",
                        text: $username
                    )
                    .padding(.vertical, 10)
                    .padding(.horizontal, 15)
                    .background(Color.white)
                    .cornerRadius(10)
                }
                
            }.padding(.horizontal, 30)
            HStack {
                
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.top, 40)
            
            NavigationLink {
                GameLobbyView()
            } label: {
                MenuItem(menuIcon: "play.fill", iconHeight: 25, iconWidth: 25, menuTitle: "Join game", menuColor: UIColor.systemBlue, menuPaddingRight: 30)
            }

        }
        .padding(.top, 20)
        .frame(maxHeight: .infinity, alignment: .top)
        .background(Image("WP1")
            .resizable()
            .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height+80)
            .brightness(-0.08)
        )
    }
}

struct JoinGameView_Previews: PreviewProvider {
    static var previews: some View {
        JoinGameView()
    }
}
