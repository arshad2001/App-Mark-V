//
//  TopView.swift
//  App-Mark-V
//
//  Created by Arshad Buchori on 30/06/24.
//

import Foundation
import SwiftUI

struct TestTopView: View {
    var body: some View {
        VStack(spacing: 8){
            //this is the code for the topview (don't forget to edit this file)
            TopView()
            
            
            
            //below this is all the rest of the views
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
    TestTopView()
}
