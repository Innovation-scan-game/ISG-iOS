//
//  LoginMainView.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 28/12/2022.
//

import SwiftUI
import Foundation

struct LoginMainView: View {
    var body: some View {
        
        VStack{
            Logo()
            
            Spacer().frame(height: 100)
            
            HStack
            {
                VStack(
                    alignment: .trailing
                ) {
                    NavigationLink(destination: LoginView()) {
                        MenuItem(
                            menuIcon: "person.badge.key.fill",
                            iconHeight: 26,
                            iconWidth: 30,
                            menuTitle: Text("start_title_1"),
                            menuColor: UIColor.systemBlue,
                            minWidth: 200
                        )
                    }
                    
                    NavigationLink(destination: RegisterView()) {
                        MenuItem(
                            menuIcon: "person.crop.circle.fill.badge.plus",
                            iconHeight: 26,
                            iconWidth: 30,
                            menuTitle: Text("start_title_2"),
                            menuColor: UIColor.systemBlue,
                            minWidth: 200
                        )
                    }
                    
                    MenuItem(
                        menuIcon: "arrowshape.turn.up.backward.fill",
                        iconHeight: 26,
                        iconWidth: 30,
                        menuTitle: Text("start_title_3"),
                        menuColor: UIColor.systemRed,
                        minWidth: nil
                    ).onTapGesture {
                        exit(0)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .backgroundImage()
        .navigationBarHidden(true)
    }
}

struct LoginMainView_Previews: PreviewProvider {
    static var previews: some View {
        LoginMainView()
    }
}
