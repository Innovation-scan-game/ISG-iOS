//
//  MainMenu.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 20/11/2022.
//

import Foundation
import SwiftUI

struct MainMenuView: View {
    @ObservedObject var vm = MainMenuViewModel()
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    HStack {
                        Image("Logo")
                            .resizable()
                            .frame(width: 70, height: 70)
                        VStack (
                            alignment: .leading
                        ) {
                            Text("Cardisc").font(.system(size: 32)).bold()
                            Text("An idea developing tool").font(.system(size: 18))
                        }
                    }
                    .padding(.vertical, 35)
                    .padding(.leading, 10)
                    .padding(.trailing, 20)
                    .background(Color.white)
                    .cornerRadius(20, corners: [.topRight, .bottomRight])
                    
                    .shadow(radius: 8)
                    .padding(.top, 20)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer().frame(height: 80)
                
                NavigationLink {
                    JoinGameView(vm: vm.gameViewModel)
                } label: {
                    MenuItem(
                        menuIcon: "person.2.fill",
                        iconHeight: 22,
                        iconWidth: 36,
                        menuTitle: "Join a game",
                        menuColor: UIColor.systemBlue,
                        menuPaddingRight: 74)
                }
                
                NavigationLink("", destination: GameLobbyView(vm: vm.gameViewModel, isHost: true), isActive: $vm.hostSucceed)
                MenuItem(menuIcon: "lock.open.fill", iconHeight: 24, iconWidth: 30, menuTitle: "Host a game", menuColor: UIColor.systemBlue, menuPaddingRight: 75, isLoading: false).onTapGesture {
                    self.vm.hostGame()
                }
                
                NavigationLink {
                    HowToPlayView()
                } label: {
                    MenuItem(
                        menuIcon: "questionmark.circle.fill",
                        iconHeight: 26,
                        iconWidth: 26,
                        menuTitle: "How-to-play",
                        menuColor: UIColor.systemBlue,
                        menuPaddingRight: 77)
                }
                
                Spacer().frame(height: 50)
                
                NavigationLink {
                    AccountSettingsView()
                } label: {
                    MenuItem(menuIcon: "gearshape.fill", iconHeight: 26, iconWidth: 26, menuTitle: "Account settings", menuColor: UIColor.systemBlue, menuPaddingRight: 40)
                }
                
                NavigationLink("", destination: StartView(), isActive: $vm.isLoggedOff)
                MenuItem(menuIcon: "arrowshape.turn.up.left.fill", iconHeight: 24, iconWidth: 30, menuTitle: "Logoff", menuColor: UIColor.systemRed, menuPaddingRight: 40, isLoading: vm.logOffIsLoading).onTapGesture {
                    vm.logOff()
                }
            }
            .navigationBarHidden(true)
            .frame(maxHeight: .infinity, alignment: .top)
        }
        .background(Image("WP1").resizable()
        .aspectRatio(contentMode: .fill)
        .edgesIgnoringSafeArea(.all))
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
