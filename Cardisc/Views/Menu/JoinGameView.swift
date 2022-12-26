//
//  JoinGame.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 20/11/2022.
//

import Foundation
import SwiftUI

struct JoinGameView: View {
    
    @ObservedObject var vm: GameViewModel
    
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
                    Text("Join a game by entering the Game ID you received from the game host.").foregroundColor(Color.white)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                
            }
            .padding(.horizontal, 30)
            .padding(.vertical, 20)
            
            VStack{
                HStack {
                    Text("Enter game id.").foregroundColor(Color(UIColor.white)).bold()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 20)
                
                HStack {
                    TextField(
                        "...",
                        text: $vm.gameId
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
            
            NavigationLink("", destination: GameLobbyView(vm: vm), isActive: $vm.nextView).onAppear {
                vm.nextView = false
                vm.startedGame = false
            }
            MenuItem(menuIcon: "lock.open.fill", iconHeight: 24, iconWidth: 30, menuTitle: "Join Game", menuColor: UIColor.systemBlue, menuPaddingRight: 40, isLoading: false).onTapGesture {
                self.vm.joinGame()
            }
            
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .background(Image("WP1").resizable()
        .aspectRatio(contentMode: .fill)
        .edgesIgnoringSafeArea(.all))
    }
}

