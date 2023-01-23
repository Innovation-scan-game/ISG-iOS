//
//  MainMenu.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 20/11/2022.
//

import Foundation
import SwiftUI
import Combine

struct ChatView: View {
    @ObservedObject var vm: GameViewModel
    @FocusState private var chatFocussed: Bool
    
    var body: some View {
        VStack {
            HStack {
                HStack {
                    Image(systemName: "message.fill")
                        .resizable()
                        .frame(width: 40, height: 30)
                        .foregroundColor(Color.white)
                    Text("chatroom_title_1")
                        .foregroundColor(Color.white)
                        .font(.system(size: 24))
                }
                .padding(.horizontal,30)
                .padding(.vertical,10)
                
                Spacer()
                
                if(vm.isHost) {
                    NavigationLink {
                        ConclusionView(vm: vm)
                    } label: {
                        MenuItem(
                            menuIcon: "arrowtriangle.right.fill",
                            iconHeight: 20,
                            iconWidth: 18,
                            menuTitle: Text("chatroom_title_2"),
                            menuColor: UIColor.systemBlue,
                            minWidth: nil
                        )
                    }
                }

            }
            
            if(vm.currentCard.type == 1) {
                SummaryScalable(vm: vm)
            }
            else if(vm.currentCard.type == 2) {
                SummaryMPC(vm: vm)
            }
            else {
                SummaryOpen(vm: vm)
            }
            
            ChatMessageList(vm: self.vm)
            
            VStack {
                HStack {
                    TextField(
                        "...",
                        text: $vm.chatMessage
                    )
                    .focused(self.$chatFocussed)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 15)
                    .background(Color.white)
                    .foregroundColor(Color.black)
                    .cornerRadius(25)
                    .shadow(radius: 0.5)
                    .padding(.vertical, 15)
                    .padding(.leading, 10)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    
                    Image(systemName: "paperplane.circle.fill").resizable().frame(width: 35, height: 35).padding(.trailing, 10).foregroundColor(Color(UIColor.systemBlue)).onTapGesture {
                        vm.sendChatMessage()
                        self.chatFocussed = false
                    }
                }
                .padding(.bottom, 20)
                .background(Color(UIColor.systemGray5))
            }
            .offset(y: -vm.keyboardHeigtChat)
            .onAppear{
                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { (notification) in
                    let value = notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
                    vm.keyboardHeigtChat = value.height-20
                }
                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { (notification) in
                    vm.keyboardHeigtChat = 0
                }
            }

            
            Spacer()
        }
        .backgroundImage(imageName: "WP1")
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarBackButtonHidden(true)
        .navigationDestination(isPresented: $vm.nextRoundStarted) { CardView(vm: vm) }
        .navigationDestination(isPresented: $vm.finishedGame) { NavigationLazyView(MainMenuView()) }
        .navigationDestination(isPresented: $vm.leftGame) { NavigationLazyView(MainMenuView()) }
        .fullScreenCover(isPresented: $vm.isLoadingMainMenu) {
            LoadingView(title: Text("loading_title_2"), message: Text("loading_subtitle_2"), icon: "flag.2.crossed.fill", iconWidth: 45, returnButton: false)
        }
        
        
        .navigationBarItems(
            leading:
                Button(action: { vm.showLeaveConfirmation.toggle()}) {
                    Image(systemName: "chevron.left")
                    Text("host_menu_backbutton_text")
                }
        .alert(isPresented: $vm.showLeaveConfirmation) {
            Alert(
                title: Text("host_menu_title_7"),
                message: Text("host_menu_subtitle_1"),
                primaryButton: .destructive(Text("host_menu_title_8")) { vm.leaveGame()},
                secondaryButton: .cancel())
        })
        
        .alert(isPresented: $vm.showErrorMessage) {
                    Alert(title: Text("Action failed!"), message: Text("chaterror"), dismissButton: .default(Text("OK")) {
                        vm.showErrorMessage = false
                    })
                }
        .alert(isPresented: $vm.showQuestion) {
            Alert(title: Text("\(vm.currentCard.name)"), message: Text("\(vm.currentCard.body)"), dismissButton: .default(Text("OK")) {
                        vm.showQuestion = false
                    })
                }

    }
}
