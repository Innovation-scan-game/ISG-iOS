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
        NavigationLink("", destination: NavigationLazyView(MainMenuView()), isActive: $vm.finishedGame)
        NavigationLink("", destination: CardView(vm: vm), isActive: $vm.nextView).onAppear{ vm.nextView = false }
        
        VStack {
            HStack {
                Image(systemName: "highlighter").resizable().foregroundColor(Color.white).frame(width: 25, height: 30)
                Text("Conclusion (optional)").font(.system(size: 28)).foregroundColor(Color.white).bold()
            }.frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 30)
            
            HStack {
                Text("Add a conclussion to the conversation in the previous view")
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
            }
            MenuItem(menuIcon: "play.fill", iconHeight: 20, iconWidth: 18, menuTitle: "Continue", menuColor: UIColor.systemBlue, menuPaddingRight: 10).onTapGesture {
                vm.nextRound()
            }
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding(.top, 40)
        .background(Image("WP2")
            .resizable()
            .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height+70)
        )
        .navigationBarHidden(true)
        
        
    }
}
