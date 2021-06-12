//
//  CookingMenuView.swift
//  TheGoodFork
//
//  Created by admin on 11/06/2021.
//

import SwiftUI
import UIKit

struct CookingMenuView: View {

    @EnvironmentObject var Api: Api
    
    var body: some View {
        ScrollView {


        }.navigationTitle("Menus en attente")
}
}

struct CookingMenuView_Previews: PreviewProvider {
    static var previews: some View {
        CookingMenuView()
    }
}
