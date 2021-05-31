//
//  RecapCommand.swift
//  TheGoodFork
//
//  Created by admin on 29/05/2021.
//


import SwiftUI
import UIKit

struct RecapCommandView: View {

    @EnvironmentObject var Command: Command
    
    
    var body: some View {
        ScrollView {
        HStack (alignment: .center, spacing: 10) {
            Image("logo-white")
                .resizable()
                .frame(width: 150, height: 150)
            }
    }
}
}

struct RecapCommandView_Previews: PreviewProvider {
    static var previews: some View {
        RecapCommandView()
    }
}
