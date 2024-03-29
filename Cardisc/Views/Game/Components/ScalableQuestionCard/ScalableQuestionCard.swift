//
//  CardItem.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 25/11/2022.
//

import Foundation
import SwiftUI

struct ScalableQuestionCard : View {
    @StateObject var vm: GameViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("\(vm.currentCard.name)").foregroundColor(Color.black).bold().font(.system(size: 20))
                Spacer()
                Text("questionroom_title_3") + Text(" \(vm.gameIndex+1)/\(vm.game.cards.count)")
            }
            .padding(.bottom, 10)
            .frame(alignment: .top)
            
            HStack {
                Text(vm.currentCard.body)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                Text("**Score:** \(Int(vm.scalableAnswer))")
                Slider(value: $vm.scalableAnswer, in: 1...5, step: 1) { value in
                    vm.answer = String(vm.scalableAnswer)
                }.padding(.horizontal, 10).onAppear{
                    vm.answer = String(vm.scalableAnswer)
                }
                HStack {
                    Text("Disagree")
                    Spacer()
                    Text("Agree")
                }
            }
            .padding(.top, 50)
        }
        .padding(25)
        .background(Color.white)
        .cornerRadius(10, corners: [.allCorners])
        .padding(.horizontal, 30)
        .shadow(radius: 10)
        .foregroundColor(Color.black)
        .padding(.bottom, 20)
        
        MenuItem(
            menuIcon: "play.fill",
            iconHeight: 22,
            iconWidth: 22,
            menuTitle: Text("questionroom_title_4"),
            menuColor: UIColor.systemBlue,
            minWidth: nil).onTapGesture {
            vm.submitAnswer()
        }
        .navigationDestination(isPresented: $vm.submittedAnswer) { ChatView(vm: vm) }
    }
}

