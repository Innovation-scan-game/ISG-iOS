//
//  ForgotPassword.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 20/11/2022.
//

import Foundation
import SwiftUI

struct ForgotPasswordView: View {
    @State private var emailadress: String = ""
    
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
                    Image(systemName: "person.badge.key.fill")
                        .resizable()
                        .frame(width: 30, height: 28)
                        .foregroundColor(Color.white)
                        .padding(.trailing, 5)
                    Text("Forgot password").font(.system(size: 24)).foregroundColor(Color.white).bold()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                
                Text("Enter you e-mailadress below and than you will receive a mail to create a new password.")
                    .foregroundColor(Color.white).padding(.bottom, 20)
                
                VStack {
                    Text("Emailadress").frame(maxWidth: .infinity, alignment: .leading).bold().foregroundColor(Color(UIColor.white))
                    TextField(
                        "...",
                        text: $emailadress
                    )
                    .padding(.vertical, 10)
                    .padding(.horizontal, 15)
                    .background(Color.white)
                    .cornerRadius(10)
                }.padding(.bottom, 15)
                
            }.padding(.horizontal, 30)
            
            HStack {
                MenuItem(menuIcon: "envelope.fill", iconHeight: 20, iconWidth: 30, menuTitle: "Send mail", menuColor: UIColor.systemBlue, menuPaddingRight: 40, destination: nil)
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

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
