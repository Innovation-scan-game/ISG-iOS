//
//  MainMenu.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 20/11/2022.
//

import Foundation
import SwiftUI

struct CardView: View {
    @StateObject var vm: GameViewModel
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "iphone.badge.play").resizable().foregroundColor(Color.white).frame(width: 25, height: 30)
                Text("questionroom_title_1").font(.system(size: 28)).foregroundColor(Color.white).bold()
                Spacer()
            }
            .padding(.leading, 30)
            
            HStack {
                Text("questionroom_subtitle_1").font(.system(size: 20)).foregroundColor(Color.white).bold()
                Spacer()
            }
            .padding(.leading, 30)
            .padding(.bottom, 30)
            
            if(vm.currentCard.type == 1) {
                ScalableQuestionCard(vm: vm)
            }
            
            else if(vm.currentCard.type == 2) {
                MPCQuestionCard(vm: vm)
            }
            
            else {
                OpenQuestionCard(vm: vm)
            }
            Spacer()
        }
        .padding(.top, 30)
        .navigationBarHidden(true)
        .navigationDestination(isPresented: $vm.nextRoundStarted) { CardView(vm: vm) }
        .navigationDestination(isPresented: $vm.finishedGame) { NavigationLazyView(MainMenuView()) }
        .navigationDestination(isPresented: $vm.leftGame) { NavigationLazyView(MainMenuView()) }
        .fullScreenCover(isPresented: $vm.isLoadingMainMenu) {
            LoadingView(title: Text("loading_title_2"), message: Text("loading_subtitle_2"), icon: "flag.2.crossed.fill", iconWidth: 45, returnButton: false)
        }
        .backgroundImage(imageName: "WP2")
    }
}
