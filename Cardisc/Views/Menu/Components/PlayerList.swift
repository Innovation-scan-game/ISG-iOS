//
//  PlayerList.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 10/12/2022.
//

import Foundation
import SwiftUI

struct PlayerList: View {
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("Players").bold(true)
                    Spacer()
                    Text("Status").bold(true)
                }
                .padding(.horizontal, 15)
                .padding(.top, 10)
                
                Divider().frame(height: 1).foregroundColor(Color.black).padding(.horizontal, 10)
                
                
                
                
                
            }
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(10, corners: [.allCorners])
            .padding(.vertical, 5)
        }
        .background(Color.black)
    }
        
}

struct PlayerList_Previews: PreviewProvider{
    static var previews: some View {
        PlayerList()
    }
}
