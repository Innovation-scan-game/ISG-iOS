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
                    Image(systemName: "person.2.fill")
                        .resizable()
                        .frame(width: 36, height: 22)
                        .foregroundColor(Color.white)
                        .padding(.trailing, 5)
                    Text("join_menu_title_1").font(.system(size: 24)).foregroundColor(Color.white).bold()
                    Spacer()
                }
                
                HStack {
                    Text("join_menu_decription").foregroundColor(Color.white)
                    Spacer()
                }
               
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 30)
            
            VStack{
                CardiscTextfield(value: $vm.gameId, label: Text("join_menu_title_2"), placeholder: nil)
            }
            .padding(.horizontal, 30)
            
            HStack {
                Text(vm.joinSessionError).foregroundColor(Color.white)
                Spacer()
            }.padding(.horizontal, 30)

            
            MenuItem(
                menuIcon: "person.wave.2.fill",
                iconHeight: 24,
                iconWidth: 30,
                menuTitle: Text("join_menu_button_text"),
                menuColor: UIColor.systemBlue,
                minWidth: nil,
                isLoading: vm.isLoadingJoinSession
            ).onTapGesture {
                self.vm.joinGame()
            }
            
            Spacer()
        }
        .backgroundImage()
        .foregroundColor(Color.black)
        .navigationDestination(isPresented: $vm.joinedGame) { GameLobbyView(vm: vm) }
    }
}

