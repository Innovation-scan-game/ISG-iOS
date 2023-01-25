//
//  CardItem.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 25/11/2022.
//

import Foundation
import SwiftUI

struct MPCQuestionCard : View {
    @State private var answer: Int = 0
    @StateObject var vm: GameViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("\(vm.currentCard.name)").foregroundColor(Color.black).bold().font(.system(size: 20))
                Spacer()
                Text("questionroom_title_3") + Text(" \(vm.gameIndex+1)/\(vm.game.cards.count)")
            }.padding(.bottom, 10)
            
            
            HStack {
                ScrollView(.vertical) {
                    Text(vm.currentCard.body).foregroundColor(Color.black)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 5)
            
            
            
            HStack {
                Text("questionroom_title_5")
                Text(vm.answer).bold()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 15)
            
            VStack {
                HStack {
                    MPCButton(buttonBody: "A", color: UIColor.systemRed).onTapGesture { vm.answer = "A" }
                    MPCButton(buttonBody: "B", color: UIColor.systemBlue).onTapGesture { vm.answer = "B" }
                }
                HStack {
                    MPCButton(buttonBody: "C", color: UIColor.systemYellow).onTapGesture { vm.answer = "C" }
                    MPCButton(buttonBody: "D", color: UIColor.systemGreen).onTapGesture { vm.answer = "D" }
                }
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 10)
        }
        .foregroundColor(Color.black)
        .padding(20)
        .background(Color.white)
        .cornerRadius(10, corners: [.allCorners])
        .padding(.horizontal, 30)
        .shadow(radius: 10)
        .padding(.bottom, 20)
        
        MenuItem(
            menuIcon: "play.fill",
            iconHeight: 22,
            iconWidth: 22,
            menuTitle: Text("questionroom_title_4"),
            menuColor: UIColor.systemBlue,
            minWidth: nil
        ).onTapGesture {
            vm.submitAnswer()
        }
        .navigationDestination(isPresented: $vm.submittedAnswer) { ChatView(vm: vm) }
    }
}
