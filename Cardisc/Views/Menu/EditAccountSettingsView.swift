//
//  EditAccountSettingsView.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 21/11/2022.
//

import Foundation
import SwiftUI

struct EditAccountSettingsView: View {
    @ObservedObject var vm: UserViewModel
    
    var body: some View {
        VStack {
            VStack {
                VStack {
                    VStack{
                        HStack {
                            Image(systemName: "gearshape.fill")
                                .resizable()
                                .frame(width: 30, height: 28)
                                .foregroundColor(Color.white)
                            Text("editaccountinfo_title_1").font(.system(size: 24)).foregroundColor(Color.white).bold()
                            Spacer()
                        }



                        HStack {
                            Text("editaccountinfo_text")
                                .foregroundColor(Color.white).padding(.bottom, 20)
                            Spacer()
                        }


                        CardiscTextfield(value: $vm.username, label: Text("editaccountinfo_title_2"), placeholder: nil)
                        
                        CardiscTextfield(value: $vm.email, label: Text("editaccountinfo_title_3"), placeholder: nil)
                        
                        CardiscPasswordfield(value: $vm.password, label: Text("editaccountinfo_title_4"))
                        
                        CardiscPasswordfield(value: $vm.password2, label: Text("editaccountinfo_title_5"))
                        
                        HStack {
                            Text(vm.errorMsg).foregroundColor(Color.white)
                            Spacer()
                        }

                    }
                }

            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .padding(.horizontal, 30)
            .padding(.vertical, 20)

            MenuItem(
                menuIcon: "checkmark",
                iconHeight: 22,
                iconWidth: 26,
                menuTitle: Text("editaccountinfo_title_7"),
                menuColor: UIColor.systemBlue,
                minWidth: nil)
            .onTapGesture {
                vm.editingUserCredentials.toggle()
            }
            .navigationDestination(isPresented: $vm.updatedUser) { StartView() }

            Spacer()
        }
        .backgroundImage()
        .foregroundColor(Color.black)
        .alert(isPresented: $vm.editingUserCredentials) { Alert(
            title: Text("editaccountinfo_title_8"),
            message: Text("editaccountinfo_text_2"),
            primaryButton: .destructive(Text("editaccountinfo_title_7"))
            {
                vm.updateUser()
            }, secondaryButton: .cancel()
            {
                vm.editingUserCredentials.toggle()
            }
        )
        }
    }
}
