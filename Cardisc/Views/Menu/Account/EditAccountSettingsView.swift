//
//  EditAccountSettingsView.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 21/11/2022.
//

import Foundation
import SwiftUI

struct EditAccountSettingsView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            // Logo
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
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer().frame(height: 50)
            
            VStack{
                HStack {
                    Image(systemName: "gearshape.fill")
                        .resizable()
                        .frame(width: 30, height: 28)
                        .foregroundColor(Color.white)
                    Text("Edit account settings").font(.system(size: 24)).foregroundColor(Color.white).bold()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                
                HStack {
                    Text("//..")
                        .foregroundColor(Color.white).padding(.bottom, 20)
                }.frame(maxWidth: .infinity, alignment: .leading)

                
                VStack {
                    Text("Username").frame(maxWidth: .infinity, alignment: .leading).bold().foregroundColor(Color(UIColor.white))
                    TextField(
                        "...",
                        text: $username
                    )
                    .padding(.vertical, 10)
                    .padding(.horizontal, 15)
                    .background(Color.white)
                    .cornerRadius(10)
                }.padding(.bottom, 5)
                
                VStack {
                    Text("Emailadress").frame(maxWidth: .infinity, alignment: .leading).bold().foregroundColor(Color(UIColor.white))
                    TextField(
                        "...",
                        text: $password
                    )
                    .padding(.vertical, 10)
                    .padding(.horizontal, 15)
                    .background(Color.white)
                    .cornerRadius(10)
                }.padding(.bottom, 5)
                
                VStack {
                    Text("Account type").frame(maxWidth: .infinity, alignment: .leading).bold().foregroundColor(Color(UIColor.white))
                    TextField(
                        "...",
                        text: $password
                    )
                    .padding(.vertical, 10)
                    .padding(.horizontal, 15)
                    .background(Color.white)
                    .cornerRadius(10)
                }.padding(.bottom, 5)
            }.padding(.horizontal, 30)
            
            HStack {
                MenuItem(menuIcon: "checkmark", iconHeight: 26, iconWidth: 30, menuTitle: "Confirm", menuColor: UIColor.systemBlue, menuPaddingRight: 40, destination: nil)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.top, 50)
            
            
            

            
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .background(Image("WP1")
            .resizable()
            .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height+30)
            .brightness(-0.08)
        )
    }
}

struct EditAccountSettings: PreviewProvider {
    static var previews: some View {
        EditAccountSettingsView()
    }
}
