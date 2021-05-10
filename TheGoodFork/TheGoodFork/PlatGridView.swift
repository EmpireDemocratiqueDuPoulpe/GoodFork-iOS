//
//  PlatGridView.swift
//  TheGoodFork
//
//  Created by admin on 10/05/2021.
//

import SwiftUI
import UIKit


struct PlatGridView: View {

    let layout: [GridItem]
    
    var body: some View {
        LazyVGrid(columns: layout){
            ForEach(0 ..< 8) { item in
                NavigationLink(
                    destination: Text("Destination"),
                    label: {
                        PlatCellView()
                    })
            }
        }
    }
}

struct PlatGridView_Previews: PreviewProvider {
    static var previews: some View {
        PlatGridView(layout: [
            GridItem(.adaptive(minimum: 180))
        ])
    }
}
