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
                Logo()
                
                Spacer().frame(height: 70)
                
                NavigationLink {
                    NavigationLazyView(JoinGameView(vm: vm.gameViewModel))
                } label: {
                    MenuItem(
                        menuIcon: "person.2.fill",
                        iconHeight: 22,
                        iconWidth: 36,
                        menuTitle: Text("main_menu_title_1"),
                        menuColor: UIColor.systemBlue,
                        minWidth: 220
                    )
                }
                
                MenuItem(
                    menuIcon: "crown.fill",
                    iconHeight: 24,
                    iconWidth: 34,
                    menuTitle: Text("main_menu_title_2"),
                    menuColor: UIColor.systemBlue,
                    minWidth: 220,
                    isLoading: vm.hostGameIsLoading
                ).onTapGesture {
                    self.vm.hostGame()
                }
                
                NavigationLink {
                    HowToPlayView()
                } label: {
                    MenuItem(
                        menuIcon: "questionmark.circle.fill",
                        iconHeight: 26,
                        iconWidth: 26,
                        menuTitle: Text("main_menu_title_4"),
                        menuColor: UIColor.systemBlue,
                        minWidth: 220
                    )
                }
                
                Spacer().frame(height: 50)
                
                NavigationLink {
                    NavigationLazyView(AccountSettingsView())
                } label: {
                    MenuItem(
                        menuIcon: "gearshape.fill",
                        iconHeight: 26,
                        iconWidth: 26,
                        menuTitle: Text("main_menu_title_3"),
                        menuColor: UIColor.systemBlue,
                        minWidth: nil
                    )
                }
                
                MenuItem(
                    menuIcon: "arrowshape.turn.up.left.fill",
                    iconHeight: 24,
                    iconWidth: 30,
                    menuTitle: Text("main_menu_title_5"),
                    menuColor: UIColor.systemRed,
                    minWidth: nil,
                    isLoading: vm.logOffIsLoading
                ).onTapGesture {
                    vm.logOff()
                }
            }
            .navigationBarHidden(true)
            .frame(maxHeight: .infinity, alignment: .top)
            .navigationDestination(isPresented: $vm.hostSucceed) {
                NavigationLazyView(GameLobbyView(vm: vm.gameViewModel))
            }
            .navigationDestination(isPresented: $vm.hostSucceed) { NavigationLazyView(GameLobbyView(vm: vm.gameViewModel)) }
            .navigationDestination(isPresented: $vm.isLoggedOff) { StartView() }

        }
        .backgroundImage()
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}



