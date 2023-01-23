//
//  ChatMessageList.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 25/12/2022.
//

import Foundation
import SwiftUI

struct ChatMessageList: View {
    @ObservedObject var vm: GameViewModel
    
    var body: some View {
        ScrollViewReader { scrollView in
            ScrollView(.vertical) {
                LazyVStack {
                    ForEach(vm.chatMessages) { message in
                        ChatMessageItem(name: message.username, message: message.message).id(message.id).animation(.default)
                    }
                }
                
            }
            .onChange(of: vm.chatMessages) { _ in
                scrollView.scrollTo(vm.chatMessages.last?.id)
            }
            
            
        }
        .padding(.vertical, 10)
        
        
        
    }
}


////
////  ChatMessageList.swift
////  Cardisc
////
////  Created by Tim van Kesteren on 25/12/2022.
////
//
//import Foundation
//import SwiftUI
//
//struct ChatMessageList: View {
//    @Binding var chatMessages: [ChatMessage]
//
//    var body: some View {
//        ScrollViewReader { scrollView in
//            ScrollView(.vertical) {
//                LazyVStack {
//                    ForEach(chatMessages) { message in
//                        ChatMessageItem(name: message.username, message: message.message).id(message.id)
//                    }
//                }
//
//            }
//            .onAppear {
//                scrollView.scrollTo(chatMessages.last?.id)
//            }
//
//
//        }
//        .padding(.vertical, 10)
//
//
//
//    }
//}
//
