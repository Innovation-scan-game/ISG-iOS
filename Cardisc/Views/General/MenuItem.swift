//
//  MenuItem.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 20/11/2022.
//

import Foundation
import SwiftUI

struct MenuItem: View {
    
    let menuIcon: String
    let iconHeight: CGFloat
    let iconWidth: CGFloat
    let menuTitle: Text
    let menuColor: UIColor
    let minWidth: CGFloat?
    var isLoading: Bool = false
    
    var body: some View {
        HStack {
            Spacer()
            HStack{
                if (isLoading) {
                    ProgressView()
                        .frame(width: iconWidth, height: iconHeight)
                        .padding(.trailing, 5)
                        .foregroundColor(Color.white)
                }
                else {
                    Image(systemName: menuIcon)
                        .resizable()
                        .frame(width: iconWidth, height: iconHeight)
                        .padding(.trailing, 5)
                }
                
                menuTitle
                    .font(.system(size: 18)).bold()
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 15)
            .foregroundColor(Color.white)
            .frame(minWidth: minWidth ?? nil, alignment: .leading)
            .background(Color(menuColor))
            .cornerRadius(13, corners: [.topLeft, .bottomLeft])
            .shadow(radius: 25)
            .padding(.vertical, 10)
        }
    }
}
