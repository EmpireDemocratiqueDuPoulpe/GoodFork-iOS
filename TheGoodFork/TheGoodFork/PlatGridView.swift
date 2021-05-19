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
    let plats: [Recette]
    
    var body: some View {
        LazyVGrid(columns: layout){
                ForEach(plats.filter {$0.type.contains(filterByType)}, id: \.name) { plat in
                    NavigationLink(
                        destination: PlatDetailView(plat: plat),
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
        ], plats: [Recette(menu_id: 1, name: "Pizza", type: "dessert", type_id: 2, image_path: "xx", description: "ddd", ingredients: [Ingredient(ingredient_id: 1, stock_id: 1, name: "saucisse", units: 1, units_unit: "g", units_unit_id: 1)])])
    }
}
