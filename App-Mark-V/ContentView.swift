//
//  ContentView.swift
//  App-Mark-V
//
//  Created by Arshad Buchori on 29/06/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 8) {
            //TopView
            TopView()
            
            //BottomView and MiddleView
            Color.white
                .cornerRadius(8)
        }
        .cornerRadius(50)
        .padding(8)
        .background(mainGray)
        .edgesIgnoringSafeArea(.all)
        
    }
}

#Preview {
    ContentView()
}
