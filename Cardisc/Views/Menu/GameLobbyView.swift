
//
//  GameLobbyView.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 20/11/2022.
//

import Foundation
import SwiftUI
import UIKit

struct GameLobbyView: View {
    @StateObject var vm: GameViewModel
    
    var body: some View {
        VStack {
            VStack{
                HStack {
                    Image(systemName: "person.2.fill")
                        .resizable()
                        .frame(width: 38, height: 22)
                        .foregroundColor(Color.white)
                        .padding(.trailing, 1)
                    Text("host_menu_title_1").font(.system(size: 20)).bold().foregroundColor(Color.white) + Text(vm.lobby.sessionCode).font(.system(size: 20)).bold().foregroundColor(Color.white)
                    Spacer()
                    Image(systemName: "square.and.arrow.up").foregroundColor(Color.white).padding(.trailing, 20).onTapGesture {
                        vm.shareGame()
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                PlayerList(players: vm.players)
                
                if(vm.isHost) {
                    HStack {
                        Picker("", selection: $vm.rounds) {
                            ForEach(3 ..< 10) {
                                Text("\($0) ") + Text("host_menu_itempicker_name")
                            }
                        }
                        .padding(.vertical, 5)
                        .padding(.horizontal, 50)
                        .background(Color.white)
                        .frame(maxWidth: .infinity)
                        .cornerRadius(25, corners: [.allCorners])
                    }
                    .background(Color.white)
                    .cornerRadius(10, corners: [.allCorners])
                    .shadow(radius: 5)
                    .padding(.bottom, 10)
                    .shadow(radius: 5)
                }
            }
            .padding(.horizontal, 30)
            .padding(.top, 20)
            if(vm.isHost) {
                MenuItem(
                    menuIcon: "play.fill",
                    iconHeight: 25,
                    iconWidth: 25,
                    menuTitle: Text("host_menu_title_4"),
                    menuColor: UIColor.systemBlue,
                    minWidth: nil,
                    isLoading: vm.isLoadingStartingSession
                ).onTapGesture {
                    vm.startGame()
                }
            }
            if(vm.playerReady) {
                MenuItem(
                    menuIcon: "person.fill.xmark",
                    iconHeight: 25,
                    iconWidth: 35,
                    menuTitle: Text("host_menu_title_6"),
                    menuColor: UIColor.systemRed,
                    minWidth: nil,
                    isLoading: vm.loadingState
                ).onTapGesture {
                    vm.changeState()
                }
            }
            else {
                MenuItem(
                    menuIcon: "person.crop.circle.badge.checkmark",
                    iconHeight: 25,
                    iconWidth: 30,
                    menuTitle: Text("host_menu_title_5"),
                    menuColor: UIColor.systemGreen,
                    minWidth: nil,
                    isLoading: vm.loadingState
                ).onTapGesture {
                    vm.changeState()
                }
            }
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .navigationTitle("")
        .fullScreenCover(isPresented: $vm.isLoadingStartingSession) {
            LoadingView(title: Text("loading_title_1"), message: Text("loading_subtitle_1"), icon: "hourglass.tophalf.filled", iconWidth: 25, returnButton: false)
        }
        .fullScreenCover(isPresented: $vm.isReconnecting) {
            LoadingView(title: Text("loading_title_3"), message: Text("loading_subtitle_3"), icon: "network", iconWidth: 30, returnButton: true)
        }
        .navigationDestination(isPresented: $vm.startedGame, destination: { CardView(vm: vm) })

        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(isPresented: $vm.leftGame, destination: {
            NavigationLazyView(MainMenuView())
        })
        .navigationBarBackButtonHidden(true)
        .backgroundImage(imageName: "WP3")
        .navigationBarItems(leading: Button(action: { vm.showConfirmation.toggle()}) {
            Image(systemName: "chevron.left")
            Text("Leave session")
        }
            .alert(isPresented: $vm.showConfirmation) { Alert(
                title: Text("host_menu_title_7"),
                message: Text("host_menu_subtitle_1"),
                primaryButton: .destructive(Text("host_menu_title_8"))
                {
                    vm.leaveGame()
                }, secondaryButton: .cancel())})

    }
}
