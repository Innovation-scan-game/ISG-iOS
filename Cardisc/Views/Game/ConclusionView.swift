//
//  ConclussionView.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 20/11/2022.
//

import Foundation
import SwiftUI

struct ConclusionView: View {
    @ObservedObject var vm: GameViewModel
    
    var body: some View {
        
        VStack {
            HStack {
                Image(systemName: "highlighter").resizable().foregroundColor(Color.white).frame(width: 25, height: 30)
                Text("conclusion_title_1").font(.system(size: 28)).foregroundColor(Color.white).bold()
            }.frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 30)
            
            HStack {
                Text("conclusion_text_1")
            }
            .foregroundColor(Color.white)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 30)
            .padding(.bottom, 30)
            
            VStack {
                TextField(
                    "...",
                    text: $vm.conclusion
                )
                .padding(.top, 10)
                .padding(.bottom, 60)
                .padding(.horizontal, 15)
                .background(Color.white)
                .cornerRadius(15, corners: [.allCorners])
                .padding(.horizontal, 30)
                .shadow(radius: 10)
                .padding(.bottom, 20)
            }
            MenuItem(
                menuIcon: "play.fill",
                iconHeight: 20,
                iconWidth: 18,
                menuTitle: Text("conclusion_title_2"),
                menuColor: UIColor.systemBlue,
                minWidth: nil
            ).onTapGesture {
                vm.nextRound()
            }
        }
        .foregroundColor(Color.black)
        .frame(maxHeight: .infinity, alignment: .top)
        .padding(.top, 10)
        .backgroundImage(imageName: "WP3")
        .navigationDestination(isPresented: $vm.finishedGame) { NavigationLazyView(MainMenuView()) }
        .navigationDestination(isPresented: $vm.nextRoundStarted) { CardView(vm: vm) }
        .fullScreenCover(isPresented: $vm.isLoadingMainMenu) {
            LoadingView(title: Text("loading_title_2"), message: Text("loading_subtitle_2"), icon: "flag.2.crossed.fill", iconWidth: 45, returnButton: false)
        }
    }
}
