//
//  PlayerAnswerListMPC.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 30/12/2022.
//

import Foundation
import SwiftUI

struct SummaryMPC: View {
    
    @ObservedObject var vm: GameViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("chatroom_title_3").bold()
                Spacer()
                Text("chatroom_title_4") + Text(" \(vm.answers.count)/\(vm.players.count)")
            }
            Divider()
            HStack {
                ForEach(vm.summaryMPC.keys.sorted(), id: \.self) { key in
                    VStack{
                        Spacer()
                        Text("\(vm.summaryMPC[key]!)")
                        
                        if(vm.summaryMPC[key]! > 0) {
                            HStack{}.frame(width: 35, height: CGFloat((80/vm.players.count)) * CGFloat(vm.summaryMPC[key]!)).background(Color(UIColor.systemBlue)).shadow(radius: 5)
                        }
                        else {
                            HStack{}.frame(width: 35, height: 3).background(Color(UIColor.systemRed)).shadow(radius: 5)
                        }
                        
                        
                        Text("\(key)")
                    }.padding(.horizontal, 20).frame(maxHeight: 150)
                }
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

