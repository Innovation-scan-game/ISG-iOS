//
//  Login.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 20/11/2022.
//

import Foundation
import SwiftUI

struct LoginView: View {
    @ObservedObject private var vm = LoginViewModel()
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Image(systemName: "person.crop.circle.badge.plus.fill")
                        .resizable()
                        .frame(width: 32, height: 28)
                        .foregroundColor(Color.white)
                        .padding(.trailing, 5)
                    Text("login_title_1").font(.system(size: 24)).foregroundColor(Color.white).bold()
                    Spacer()
                }
                
                
                HStack {
                    Text("login_text").foregroundColor(Color.white).padding(.bottom, 20)
                    Spacer()
                }
                
                CardiscTextfield(value: $vm.username, label: Text("login_title_2"), placeholder: "JohnDoe123")
                
                CardiscPasswordfield(value: $vm.password, label: Text("login_title_3"))
                
                HStack {
                    Text(vm.errorMessage).foregroundColor(Color.white)
                    Spacer()
                }
                

            }
            .padding(.horizontal, 30)
            .padding(.vertical, 20)
            
            MenuItem(
                menuIcon: "lock.open.fill",
                iconHeight: 26,
                iconWidth: 30,
                menuTitle: Text("login_title_4"),
                menuColor: UIColor.systemBlue,
                minWidth: nil,
                isLoading: vm.isRequestInProgress
            ).onTapGesture {
                vm.loginUser()
            }
            Spacer()
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .backgroundImage()
        .navigationDestination(isPresented: $vm.loggedIn) { StartView() }
        
    }
    
    struct LoginView_Previews: PreviewProvider {
        static var previews: some View {
            LoginView()
        }
    }
}


