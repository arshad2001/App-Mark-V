//
//  TopView.swift
//  App-Mark-V
//
//  Created by Arshad Buchori on 30/06/24.
//

import Foundation
import SwiftUI

struct TopView: View {
    var body: some View {
        ZStack{
            VStack{
                Color.black
                    .frame(height:48)
                HStack{
                    //left
                    VStack(spacing: 0){
                        HStack{
                            ZStack(alignment: Alignment(horizontal: .center, vertical: .center)){
                                RoundedRectangle(cornerSize: CGSize(width: 4, height: 4))
                                    .foregroundColor(.white)
                                    .frame(width: 50, height: 24)
                                HStack{
                                    Text("REC")
                                        .font(.system(size: 14).bold())
                                        .ignoresSafeArea(.all, edges: .horizontal)
                                }
                            }
                            Spacer()
                        }
                        .padding(8)
                        VStack(alignment: .leading) {
                            Text("1h07m25s")
                                .font(.largeTitle)
                            Text("MP3. 320Kbps")
                        }
                        .foregroundColor(.white)
                        .padding(8)
                    }
                    .background(mainGray)
                    .cornerRadius(4)
                    
                    //right
                    VStack(spacing: 0){
                        HStack{
                            VStack(alignment: .leading){
                                Text("20241025_03.mp3")
                                Text("72.8MB")
                                    .opacity(0.4)
                            }
                            .foregroundColor(.white)
                            Spacer()
                        }
                        .padding(8)
                        VStack(alignment: .leading) {
                            HStack {
                                Text("L")
                                Rectangle()
                                    .frame(width: 40,height: 16)
                                    .opacity(0.5)
                                Spacer()
                                Text("-7dB")
                            }
                            HStack {
                                Rectangle()
                                    .frame(height: 1)
                                    .opacity(0.4)
                            }
                            HStack {
                                Text("R")
                                Rectangle()
                                    .frame(width: 80,height: 16)
                                    .opacity(0.5)
                                Spacer()
                                Text("-21dB")
                            }
                        }
                        .foregroundColor(.white)
                        .padding(8)
                    }
                    .background(.black)
                    .cornerRadius(4)
                }
                
            }
            .padding(8)
        }
        
        .background(.black)
        .cornerRadius(8)
        .frame(height: 180)
        .padding(.top, -8)
    }
}



#Preview {
    TopView()
}
