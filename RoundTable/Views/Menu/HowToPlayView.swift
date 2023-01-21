//
//  HowToPlayView.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 20/11/2022.
//

import Foundation
import SwiftUI

struct HowToPlayView: View {
    var body: some View {
        VStack {
            VStack{
                HStack {
                    Image(systemName: "person.fill.questionmark.rtl")
                        .resizable()
                        .frame(width: 30, height: 28)
                        .foregroundColor(Color.white)
                        .padding(.trailing, 5)
                    Text("htp_title_1").font(.system(size: 24)).foregroundColor(Color.white).bold()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
            }.padding(.horizontal, 30)
            VStack{
                ScrollView {
                    HStack {
                        Text("htp_subtitle_1").foregroundColor(Color.white).bold()
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    HStack {
                        Text("htp_text_1").foregroundColor(Color.white)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    HStack {
                        Text("htp_subtitle_2").foregroundColor(Color.white).bold()
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 20)
                    HStack {
                        Text("htp_text_2").foregroundColor(Color.white)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    HStack {
                        Text("htp_subtitle_3").foregroundColor(Color.white).bold()
                    }
                    .padding(.top, 20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    HStack {
                        Text("htp_text_3").foregroundColor(Color.white)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 10)
                    
                }
            }.padding(.horizontal, 30)
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding(.top, 10)
        .backgroundImage(imageName: "WP2")
    }
}

struct HowToPlayView_Previews: PreviewProvider {
    static var previews: some View {
        HowToPlayView()
    }
}
