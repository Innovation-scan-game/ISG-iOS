//
//  LoadingView.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 20/11/2022.
//

import Foundation
import SwiftUI

struct LoadingView: View {
    let title: Text
    let message: Text
    let icon: String
    let iconWidth: CGFloat
    
    var body: some View {
        VStack {
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
        .backgroundImage()
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(title: Text("Loading view"), message: Text("Please wait while the next view is being loaded.."), icon: "hourglass.tophalf.filled", iconWidth: 25)
    }
}
