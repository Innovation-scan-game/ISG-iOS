//
//  AccountSettings.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 20/11/2022.
//

import Foundation
import SwiftUI

struct AccountSettingsView: View {
    private let vm = UserViewModel()
    
    var body: some View {
        VStack {
            VStack{
                HStack {
                    Image(systemName: "gearshape.fill")
                        .resizable()
                        .frame(width: 30, height: 28)
                        .foregroundColor(Color.white)
                    Text("Account settings").font(.system(size: 24)).foregroundColor(Color.white).bold()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                
                HStack {
                    Image("UserIcon")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .padding(20)
                    VStack {
                        HStack {
                            Text(vm.getInfo(userDefaults: "USERNAME")).bold().font(.system(size: 16))
                            Spacer()
                            Text("ID")
                        }
                        Divider().frame(height: 0.2)
                        VStack {
                            HStack {
                                Text("Account type:")
                                Spacer()
                                Text("...")
                            }
                            HStack {
                                Text("Emailadress:")
                                Spacer()
                                Text("...")
                            }
                            HStack {
                                Text("Password:")
                                Spacer()
                                Text("...")
                            }
                        }
                        .foregroundColor(Color(UIColor.systemGray))
                    }
                    .padding(.trailing,40)
                    .padding(.vertical, 20)
                    .font(.system(size: 14))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(UIColor.white))
                .cornerRadius(10)
                .shadow(radius: 5)

                
                
            }.padding(.horizontal, 30)
            
            NavigationLink {
                EditAccountSettingsView()
            } label: {
                HStack {
                    MenuItem(menuIcon: "square.and.pencil", iconHeight: 26, iconWidth: 26, menuTitle: "Edit account info", menuColor: UIColor.systemBlue, menuPaddingRight: 40)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.top, 50)
            }
            
            
            
            HStack {
                MenuItem(menuIcon: "camera.fill", iconHeight: 22, iconWidth: 30, menuTitle: "Change picture", menuColor: UIColor.systemBlue, menuPaddingRight: 40)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            
            HStack {
                MenuItem(menuIcon: "trash.fill", iconHeight: 26, iconWidth: 26, menuTitle: "Delete account", menuColor: UIColor.systemRed, menuPaddingRight: 40)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            
            
            

            
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding(.top, 30)
        .background(Image("WP1")
            .resizable()
            .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height+70)
            .brightness(-0.08)
        )
    }
}

struct AccountSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        AccountSettingsView()
    }
}
