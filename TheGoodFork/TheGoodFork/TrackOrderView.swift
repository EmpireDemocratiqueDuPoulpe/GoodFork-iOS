//
//  TrackOrderView.swift
//  TheGoodFork
//
//  Created by admin on 09/06/2021.
//


import SwiftUI
import UIKit

struct TrackOrderView: View {
    @EnvironmentObject var Api: Api
    
    var body: some View {
        ScrollView {
            ForEach(Api.viewOrder, id: \.menu_id) { menu in
                Text("\(menu.name)")
            }
        }.navigationTitle("Suivi de commande")
}
}

struct TrackOrderView_Previews: PreviewProvider {
    static var previews: some View {
        TrackOrderView()
    }
}
