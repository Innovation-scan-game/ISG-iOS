//
//  GameLobbyView.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 20/11/2022.
//

import Foundation
import SwiftUI

struct GameLobbyView: View {
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack {
                    Image("WP1")
                        .resizable()
                        .aspectRatio(geometry.size, contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                
                    VStack{
                        HStack {
                            Image(systemName: "person.2.fill")
                                .resizable()
                                .frame(width: 38, height: 22)
                                .foregroundColor(Color.white)
                                .padding(.trailing, 1)
                            Text("Game lobby (1BB4)").font(.system(size: 20)).bold().foregroundColor(Color.white)
                            Spacer()
                            Image(systemName: "square.and.arrow.up").foregroundColor(Color.white).padding(.trailing, 20)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack {
                            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi sed dictum eros, quis aliquet tellus.")
                                .foregroundColor(Color.white)
                        }
                    }
                    .padding(.horizontal, 35)
                }
            }
        }
    }
}


struct GameLobbyView_Previews: PreviewProvider {
    static var previews: some View {
        GameLobbyView()
    }
}
