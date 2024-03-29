//
//  PlayerAnswerList.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 24/12/2022.
//

import Foundation
import SwiftUI

struct SummaryOpen: View {
    
    @ObservedObject var vm: GameViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("chatroom_title_3").bold()
                Spacer()
                Text("chatroom_title_4") + Text(" \(vm.answers.count)/\(vm.players.count)")
                Spacer()
                Image(systemName: "questionmark.app.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color.blue)
                    .onTapGesture {
                    vm.showQuestion.toggle()
                }
            }
            
            Divider()
            
            ScrollViewReader { scrollView in
                ScrollView(.vertical) {
                    LazyVStack {
                        ForEach(vm.answers) { answer in
                            PlayerAnswerOpen(answer: answer).id(answer.id)
                        }
                    }
                }
                .animation(.easeIn, value: vm.answers)
                .onChange(of: vm.answers) { newValue in
                    scrollView.scrollTo(vm.answers.last?.id)
                }
            }
            
        }
        .foregroundColor(Color.black)
        .padding(15)
        .background(Color.white)
        .cornerRadius(10, corners: [.allCorners])
        .padding(.horizontal, 30)
        .shadow(radius: 5)
        .frame(maxHeight: 220)
        .padding(.bottom, 20)
    }
}


