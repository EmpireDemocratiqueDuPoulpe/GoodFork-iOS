//
//  PlatGridView.swift
//  TheGoodFork
//
//  Created by admin on 10/05/2021.
//

import SwiftUI
import UIKit


struct PlatGridView: View {
    
    @Binding var filterByType: String

    let layout: [GridItem]
    let plats: [Plat]
    
    var body: some View {
        LazyVGrid(columns: layout){
                ForEach(plats.filter {$0.type.contains(filterByType)}, id: \.name) { plat in
                    NavigationLink(
                        destination: Text("Destination"),
                        label: {
                            PlatCellView(plat: plat)
                        }).padding(.horizontal,  10)
                }

        }
    }
}

struct PlatGridView_Previews: PreviewProvider {
    static var previews: some View {
        PlatGridView(filterByType: Binding.constant("plat"), layout: [
            GridItem(.adaptive(minimum: 180))
        ], plats: plats)
    }
}
