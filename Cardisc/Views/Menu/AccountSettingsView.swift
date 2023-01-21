//
//  AccountSettings.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 20/11/2022.
//

import Foundation
import SwiftUI
import PhotosUI

struct AccountSettingsView: View {
    @ObservedObject var vm = UserViewModel()
    
    var body: some View {
        VStack {
            VStack {
                VStack{
                    HStack {
                        Image(systemName: "gearshape.fill")
                            .resizable()
                            .frame(width: 30, height: 28)
                            .foregroundColor(Color.white)
                        
                        Text("accountsettings_title_1").font(.system(size: 24)).foregroundColor(Color.white).bold()
                        
                        Spacer()
                    }
                    
                    
                    HStack {
                        if(vm.imageLoading) {
                            ProgressView()
                                .frame(width: 120, height: 80)
                        }
                        else if(vm.currentUser.picture != "") {
                            AsyncImage(url: URL(string: vm.currentUser.picture)) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 80, height: 80)
                                    .clipShape(Circle())
                                    .padding(20)
                            } placeholder: {
                                ProgressView()
                                    .frame(width: 80, height: 80)
                            }
                        }
                        else {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .frame(width: 70, height: 70)
                                .foregroundColor(Color.black)
                                .padding(.horizontal, 20)
                        }
                        VStack {
                            HStack {
                                Text(vm.currentUser.username).lineLimit(1)
                                    .bold()
                                    .font(.system(size: 16))
                                    .foregroundColor(Color.black)
                                Spacer()
                            }
                            Divider().frame(height: 0.2)
                            VStack {
                                HStack {
                                    Text("accountsettings_subtitle_1")
                                    Spacer()
                                    Text(vm.currentUser.email).lineLimit(1)
                                }
                                HStack {
                                    Text("accountsettings_subtitle_2")
                                    Spacer()
                                    Text("********")
                                }
                            }
                            .foregroundColor(Color.gray)
                        }
                        .padding(.trailing,40)
                        .padding(.vertical, 20)
                        .font(.system(size: 14))
                        
                        Spacer()
                    }
                    
                    .background(Color(UIColor.white))
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    
                    
                    
                }.padding(.horizontal, 30)
                
                NavigationLink {
                    EditAccountSettingsView(vm: vm)
                } label: {
                    MenuItem(
                        menuIcon: "square.and.pencil",
                        iconHeight: 26,
                        iconWidth: 26,
                        menuTitle: Text("accountsettings_title_2"),
                        menuColor: UIColor.systemBlue,
                        minWidth: nil
                    ).padding(.top, 60)
                }
                
                PhotosPicker(
                    selection: $vm.imageSelection,
                    matching: .images,
                    photoLibrary: .shared()
                ) {
                    MenuItem(
                        menuIcon: "camera.fill",
                        iconHeight: 22,
                        iconWidth: 30,
                        menuTitle: Text("accountsettings_title_3"),
                        menuColor: UIColor.systemBlue,
                        minWidth: nil
                    )
                }
                
                
                MenuItem(
                    menuIcon: "trash.fill",
                    iconHeight: 26,
                    iconWidth: 26,
                    menuTitle: Text("accountsettings_title_4"),
                    menuColor: UIColor.systemRed,
                    minWidth: nil)
                .onTapGesture {
                    vm.showDeleteUserComfirmation = true
                }
                
                Spacer()
            }
            .padding(.top, 20)
        }
        .navigationBarTitleDisplayMode(.inline)
        .foregroundColor(Color.black)
        .backgroundImage()
        .navigationDestination(isPresented: $vm.userDeleted, destination: {
            StartView()
        })
        .alert(isPresented: $vm.showDeleteUserComfirmation) { Alert(
            title: Text("accountsettings_title_5"),
            message: Text("accountsettings_subtitle_3"),
            primaryButton: .destructive(Text("accountsettings_title_6")) {
                vm.deleteUser()
            }, secondaryButton: .cancel())}
    }
}

struct AccountSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        AccountSettingsView()
    }
}

