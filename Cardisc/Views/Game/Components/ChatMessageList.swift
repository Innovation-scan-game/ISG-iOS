//
//  ChatMessageList.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 25/12/2022.
//

import Foundation
import SwiftUI

struct ChatMessageList: View {
    var chatMessages: [ChatMessage]
    
    var body: some View {
        ScrollView {
            ScrollViewReader { value in
                ForEach(chatMessages) { message in
                    ChatMessageItem(name: message.username, message: message.message)
                }
            }
        }
        .padding(.top, 10)
    }
}
