
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
    @Environment(\.dismiss) var dismiss
    @State private var showingActionSheet = false
    
    var body: some View {
        VStack {
            VStack{
                HStack {
                    Image(systemName: "person.2.fill")
                        .resizable()
                        .frame(width: 38, height: 22)
                        .foregroundColor(Color.white)
                        .padding(.trailing, 1)
                    Text("Game lobby: \(vm.lobby.sessionCode)").font(.system(size: 20)).bold().foregroundColor(Color.white)
                    Spacer()
                    Image(systemName: "square.and.arrow.up").foregroundColor(Color.white).padding(.trailing, 20).onTapGesture {
                        vm.shareGame()
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                PlayerList(players: vm.players)
                
                if(vm.isHost) {
                    HStack {
                        Picker("Number of cards", selection: $vm.rounds) {
                            ForEach(3 ..< 10) {
                                Text("\($0) round(s)")
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
                    menuTitle: "Start game",
                    menuColor: UIColor.systemBlue,
                    menuPaddingRight: 30,
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
                    menuTitle: "Unready",
                    menuColor: UIColor.systemRed,
                    menuPaddingRight: 30
                ).onTapGesture {
                    vm.changeState()
                }
            }
            else {
                MenuItem(
                    menuIcon: "person.crop.circle.badge.checkmark",
                    iconHeight: 25,
                    iconWidth: 30,
                    menuTitle: "Ready",
                    menuColor: UIColor.systemGreen,
                    menuPaddingRight: 30
                ).onTapGesture {
                    vm.changeState()
                }
            }
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .navigationTitle("")
        .fullScreenCover(isPresented: $vm.isLoadingStartingSession) {
            LoadingView(title: "Starting session", message: "Prepare to answer the first questioncard..", icon: "hourglass.tophalf.filled", iconWidth: 25)
        }
        .fullScreenCover(isPresented: $vm.isReconnecting) {
            LoadingView(title: "Reconnecting", message: "Reconnecting to last session..", icon: "network", iconWidth: 30)
        }
        .navigationDestination(isPresented: $vm.startedGame, destination: { CardView(vm: vm) })

        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .backgroundImage(imageName: "WP3")
        .navigationBarItems(leading: Button(action: { vm.showConfirmation.toggle()}) {
            Image(systemName: "chevron.left")
            Text("Leave session")
        }
            .alert(isPresented: $vm.showConfirmation) { Alert(
                title: Text("Leaving current session"),
                message: Text("Are you sure you want to leave this session?"),
                primaryButton: .destructive(Text("Leave"))
                {
                    vm.leaveGame()
                    dismiss()
                }, secondaryButton: .cancel())})

    }
}
