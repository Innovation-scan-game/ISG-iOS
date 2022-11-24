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
        VStack {
            // Back button
            HStack {
                HStack {
                    Image(systemName: "chevron.left").foregroundColor(Color(UIColor.systemBlue))
                    Text("Back").foregroundColor(Color(UIColor.systemBlue))
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 25)
                .background(Color.white)
                .cornerRadius(20, corners: [.topRight, .bottomRight])
                .shadow(radius: 8)
                .padding(.top, 10)
                
                Spacer()
                
                Text("#1234")
                    .padding(.horizontal, 40)
                    .foregroundColor(Color(UIColor.white))
                    .font(.system(size: 28))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer().frame(height: 50)
            
            VStack{
                VStack{
                    HStack {
                        Image(systemName: "person.2.fill")
                            .resizable()
                            .frame(width: 44, height: 28)
                            .foregroundColor(Color.white)
                            .padding(.trailing, 1)
                        Text("Game lobby").font(.system(size: 24)).bold().foregroundColor(Color.white)
                        Spacer()
                        Image(systemName: "square.and.arrow.up").foregroundColor(Color.white).padding(.trailing, 20)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                
                VStack {
                    HStack {
                        Text("Players")
                        Spacer()
                        Text("Ready")
                    }
                    .bold()
                    
                    Divider()
                    
                    HStack {
                        Image("UserIcon").resizable().frame(width: 20, height: 20)
                        Text("Player1")
                        Spacer()
                        Image(systemName: "checkmark.circle.fill").resizable().frame(width: 20, height: 20).foregroundColor(Color(UIColor.systemGreen))
                    }
                    HStack {
                        Image("UserIcon").resizable().frame(width: 20, height: 20)
                        Text("Player2")
                        Spacer()
                        Image(systemName: "checkmark.circle.fill").resizable().frame(width: 20, height: 20).foregroundColor(Color(UIColor.systemGreen))
                    }
                    HStack {
                        Image("UserIcon").resizable().frame(width: 20, height: 20)
                        Text("Player3")
                        Spacer()
                        Image(systemName: "checkmark.circle.fill").resizable().frame(width: 20, height: 20).foregroundColor(Color(UIColor.systemGreen))
                    }
                    HStack {
                        Image("UserIcon").resizable().frame(width: 20, height: 20)
                        Text("Player4")
                        Spacer()
                        Image(systemName: "checkmark.circle.fill").resizable().frame(width: 20, height: 20).foregroundColor(Color(UIColor.systemGreen))
                    }
                    HStack {
                        Image("UserIcon").resizable().frame(width: 20, height: 20)
                        Text("Player5")
                        Spacer()
                        Image(systemName: "checkmark.circle.fill").resizable().frame(width: 20, height: 20).foregroundColor(Color(UIColor.systemGreen))
                    }
                    HStack {
                        Image("UserIcon").resizable().frame(width: 20, height: 20)
                        Text("Player6")
                        Spacer()
                        Image(systemName: "checkmark.circle.fill").resizable().frame(width: 20, height: 20).foregroundColor(Color(UIColor.systemGreen))
                    }
                    HStack {
                        Image("UserIcon").resizable().frame(width: 20, height: 20)
                        Text("Player7")
                        Spacer()
                        Image(systemName: "checkmark.circle.fill").resizable().frame(width: 20, height: 20).foregroundColor(Color(UIColor.systemGreen))
                    }
                    HStack {
                        Image("UserIcon").resizable().frame(width: 20, height: 20)
                        Text("Player8")
                        Spacer()
                        Image(systemName: "checkmark.circle.fill").resizable().frame(width: 20, height: 20).foregroundColor(Color(UIColor.systemGreen))
                    }
                }
                .padding(20)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                
                HStack {
                    Text("3 Rounds")
                    Spacer()
                    Image(systemName: "chevron.down").resizable().frame(width: 20, height: 10)
                }
                .padding(.vertical, 15)
                .padding(.horizontal, 20)
                .background(Color(UIColor.white))
                .cornerRadius(10)
                .shadow(radius: 5)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(Color(UIColor.systemGray))
            }
            .padding(.horizontal, 30)
            .padding(.bottom, 20)
            
            
            HStack {
                MenuItem(menuIcon: "play.fill", iconHeight: 25, iconWidth: 23, menuTitle: "Start game", menuColor: UIColor.systemGreen, menuPaddingRight: 40, destination: "")
            }.frame(maxWidth: .infinity, alignment: .trailing)

        }
        
        .frame(maxHeight: .infinity, alignment: .top)
        .background(Image("WP1")
            .resizable()
            .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height+30)
            .brightness(-0.08)
        )
        
        

    }
}


struct GameLobbyView_Previews: PreviewProvider {
    static var previews: some View {
        GameLobbyView()
    }
}
