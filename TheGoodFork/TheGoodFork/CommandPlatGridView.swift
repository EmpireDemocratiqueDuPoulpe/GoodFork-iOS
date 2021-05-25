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
    let plats: [Recette]
    
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
        ], plats: [Recette(menu_id: 1, name: "Pizza", type: "dessert", type_id: 2, image_path: "xx", description: "ddd", price: 2, ingredients: [Ingredient(ingredient_id: 1, stock_id: 1, name: "saucisse", units: 1, units_unit: "g", units_unit_id: 1)])])
    }
}
