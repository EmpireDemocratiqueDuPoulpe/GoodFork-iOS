//
//  CommandPlatGridView.swift
//  TheGoodFork
//
//  Created by admin on 18/05/2021.
//

import SwiftUI
import UIKit


struct CommandPlatGridView: View {
    
    @Binding var filterByType: String

    let layout: [GridItem]
    let plats: [Plat]
    
    var body: some View {
        LazyVGrid(columns: layout){
                ForEach(plats.filter {$0.type.contains(filterByType)}, id: \.name) { plat in
                    NavigationLink(
                        destination: PlatDetailView(plat: plat),
                        label: {
                            CommandPlatCellView(plat: plat)
                        }).padding(.horizontal,  10)
                }

        }
    }
}

struct CommandPlatGridView_Previews: PreviewProvider {
    static var previews: some View {
        CommandPlatGridView(filterByType: Binding.constant("plat"), layout: [
            GridItem(.adaptive(minimum: 180))
        ], plats: plats)
    }
}
