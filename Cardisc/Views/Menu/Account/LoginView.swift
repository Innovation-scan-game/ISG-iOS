//
//  Login.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 20/11/2022.
//

import Foundation
import SwiftUI

struct LoginView: View {
    @StateObject var vm = LoginViewModel()
    @State private var username: String = ""
    @State private var password: String = ""
    @State var isActive: Bool = false
    @State var isRequestInProgress: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack{
                    HStack {
                        Image(systemName: "person.badge.key.fill")
                            .resizable()
                            .frame(width: 30, height: 28)
                            .foregroundColor(Color.white)
                            .padding(.trailing, 5)
                        Text("Login").font(.system(size: 24)).foregroundColor(Color.white).bold()
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    
                    HStack {
                        Text("Login to your Cardisc-Account to gain access to the game.")
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
                    }.padding(.bottom, 15)
                    
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
                    }
                    
                }.padding(.horizontal, 50)
                
                NavigationLink("", destination: MainMenuView(), isActive: $isActive)
                MenuItem(menuIcon: "lock.fill" , iconHeight: 26, iconWidth: 20, menuTitle: "Login", menuColor: UIColor.systemBlue, menuPaddingRight: 30).padding(.top, 20).onTapGesture {
                    self.isRequestInProgress = true
                    if(vm.loginUser(username: username, password: password)) {
                        isActive = true
                        self.isRequestInProgress = false
                    }
                }
                
                
                
            }
            .padding(.top, 40)
            .frame(maxHeight: .infinity, alignment: .top)
            .background(Image("WP1")
                .resizable()
                .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height+70)
                .brightness(-0.08)
            )
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
