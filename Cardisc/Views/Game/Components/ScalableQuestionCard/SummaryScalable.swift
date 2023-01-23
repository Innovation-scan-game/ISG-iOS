//
//  PlayerAnswerScalable.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 30/12/2022.
//

import Foundation
import SwiftUI

struct SummaryScalable: View {
    
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

            HStack {
                Text("questionroom_title_6") + Text("\(String(format: "%.1f", vm.averageScalable * 20))%")
                Spacer()
            }
            .padding(.vertical, 10)
            
            HStack {
                Slider(value: $vm.averageScalable, in: 1...5, step: 0.1).disabled(true)
            }
            .padding(.horizontal, 10)
            HStack {
                Text("questionroom_subtitle_2")
                Spacer()
                Text("questionroom_subtitle_3")
            }
        }
        .foregroundColor(Color.black)
        .padding(15)
        .background(Color.white)
        .cornerRadius(10, corners: [.allCorners])
        .padding(.horizontal, 30)
        .shadow(radius: 10)
    }
}

