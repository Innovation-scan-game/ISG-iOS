//
//  LoadingView.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 20/11/2022.
//

import Foundation
import SwiftUI
import Combine

struct LoadingView: View {
    let title: Text
    let message: Text
    let icon: String
    let iconWidth: CGFloat
    var returnButton: Bool
    
    var body: some View {
        VStack {
            if(returnButton) {
                HStack {
                    NavigationLink {
                         NavigationLazyView(MainMenuView())
                    } label: {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text("host_menu_backbutton_text")
                            Spacer()
                        }
                        .foregroundColor(Color.blue)
                        .padding(.leading, 10)
                    }
                }
            }
            
            
            Spacer()
            HStack {
                Image(systemName: icon).resizable().foregroundColor(Color.white).frame(width: iconWidth, height: 30)
                title.font(.system(size: 28)).foregroundColor(Color.white).bold()
            }
            
            HStack {
                message
            }
            .foregroundColor(Color.white)
            .padding(.horizontal, 90)
            .padding(.bottom, 30)
            
            Spacer()
        }
        .backgroundImage(imageName: "WP3")
        .navigationBarItems(
            leading:
                Button(action: { MainMenuView() }) {
                    Image(systemName: "chevron.left")
                    Text("host_menu_backbutton_text")
                }
            )
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(title: Text("Loading view"), message: Text("Please wait while the next view is being loaded.."), icon: "hourglass.tophalf.filled", iconWidth: 25, returnButton: false)
    }
}
