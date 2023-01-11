//
//  Register.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 20/11/2022.
//

import Foundation
import SwiftUI

struct RegisterView: View {
    @StateObject private var vm = RegisterViewModel()
    
    var body: some View {
        VStack {
            VStack{
                HStack {
                    Image(systemName: "person.crop.circle.badge.plus.fill")
                        .resizable()
                        .frame(width: 30, height: 26)
                        .foregroundColor(Color.white)
                        .padding(.trailing, 5)
                    Text("register_title_1").font(.system(size: 24)).foregroundColor(Color.white).bold()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                CardiscTextfield(value: $vm.username, label: Text("register_title_2"), placeholder: "JohnDoe123")
                
                CardiscTextfield(value: $vm.emailaddress, label: Text("register_title_3"), placeholder: "JohnDoe@bakmail.com")
                
                CardiscPasswordfield(value: $vm.password, label: Text("register_title_4"))
                
                CardiscPasswordfield(value: $vm.passwordRepeated, label: Text("register_title_5"))
                
                HStack {
                    Text(vm.errorMsg).foregroundColor(Color.white)
                    Spacer()
                }
                
            }
            .padding(.horizontal, 30)
            .padding(.top, 20)
            

            
            
            MenuItem(
                menuIcon: "person.crop.circle.badge.plus.fill",
                iconHeight: 26,
                iconWidth: 30,
                menuTitle: Text("register_title_6"),
                menuColor: UIColor.systemBlue,
                minWidth: nil
            ).onTapGesture {
                vm.registerUser()
            }
            .padding(.top, 15)
            
            
            
            Spacer()
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(isPresented: $vm.userRegistered, destination: { StartView() })
        .backgroundImage()
        .foregroundColor(Color.black)
        
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
