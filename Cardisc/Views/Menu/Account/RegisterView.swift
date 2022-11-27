//
//  Register.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 20/11/2022.
//

import Foundation
import SwiftUI

struct RegisterView: View {
    @State private var username: String = ""
    @State private var emailaddress: String = ""
    @State private var password: String = ""
    @State private var passwordRepeated: String = ""
    @State private var isActive: Bool = false
    
    private var vm = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            
            VStack{
                HStack {
                    Image(systemName: "person.crop.circle.badge.plus.fill")
                        .resizable()
                        .frame(width: 30, height: 28)
                        .foregroundColor(Color.white)
                        .padding(.trailing, 5)
                    Text("Register").font(.system(size: 24)).foregroundColor(Color.white).bold()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                
                VStack {
                    HStack {
                        Text("Login to your Cardisc-Account to gain access to the game.")
                            .foregroundColor(Color.white).padding(.bottom, 20)
                    }.frame(maxWidth: .infinity, alignment: .leading)
                    Text("Username").frame(maxWidth: .infinity, alignment: .leading).bold().foregroundColor(Color(UIColor.white))
                    TextField(
                        "...",
                        text: $username
                    )
                    .padding(.vertical, 10)
                    .padding(.horizontal, 15)
                    .background(Color.white)
                    .cornerRadius(10)
                }.padding(.bottom, 10)
                
                VStack {
                    Text("Emailadress").frame(maxWidth: .infinity, alignment: .leading).bold().foregroundColor(Color(UIColor.white))
                    TextField(
                        "...",
                        text: $emailaddress
                    )
                    .padding(.vertical, 10)
                    .padding(.horizontal, 15)
                    .background(Color.white)
                    .cornerRadius(10)
                }.padding(.bottom, 10)
                
                VStack {
                    Text("Password").frame(maxWidth: .infinity, alignment: .leading).bold().foregroundColor(Color(UIColor.white))
                    TextField(
                        "...",
                        text: $password
                    )
                    .padding(.vertical, 10)
                    .padding(.horizontal, 15)
                    .background(Color.white)
                    .cornerRadius(10)
                }.padding(.bottom, 10)
                
                VStack {
                    Text("Password repeated").frame(maxWidth: .infinity, alignment: .leading).bold().foregroundColor(Color(UIColor.white))
                    TextField(
                        "...",
                        text: $passwordRepeated
                    )
                    .padding(.vertical, 10)
                    .padding(.horizontal, 15)
                    .background(Color.white)
                    .cornerRadius(10)
                }
                
            }.padding(.horizontal, 30)
            
            NavigationLink("", destination: StartView(), isActive: $isActive)
            MenuItem(menuIcon: "person.crop.circle.badge.plus.fill", iconHeight: 26, iconWidth: 30, menuTitle: "Register", menuColor: UIColor.systemBlue, menuPaddingRight: 40).onTapGesture {
                if(password == passwordRepeated) {
                    if(vm.registerUser(username: username, password: password, email: emailaddress)) {
                        print("User created")
                        isActive = true
                    }
                }
                
            }
            
            
            
        }
        .padding(.top, 15)
        .frame(maxHeight: .infinity, alignment: .top)
        .background(Image("WP1")
            .resizable()
            .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height+80)
            .brightness(-0.08)
        )
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
