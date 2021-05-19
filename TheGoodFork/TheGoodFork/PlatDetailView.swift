//
//  PlatDetailView.swift
//  TheGoodFork
//
//  Created by admin on 18/05/2021.
//

import SwiftUI
import UIKit


struct PlatDetailView: View {

    let plat: Recette
    
    var body: some View {
        VStack {
            HStack {
                Image(plat.image_path)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipped()
            }
            HStack {
                Text(plat.name).font(.headline)
                Spacer()
                //Text("\(plat.price)€").font(.body).bold()
            }
            VStack(alignment: .leading,  spacing: 10){
                Spacer()
                Text("Description")
                Text("Très bon").font(.footnote)
                Spacer()
                List {
                    Section(header: Text("Composition")) {
                        ForEach(plat.ingredients, id: \.ingredient_id) { ingredient in
                                Text("\(ingredient.name)")
                            }
                    }
                }
                .listStyle(GroupedListStyle())
            }
            
        }.padding(.horizontal,  20)

    
    }
}
struct PlatDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlatCellView(plat: Recette(menu_id: 1, name: "Pizza", type: "dessert", type_id: 2, image_path: "xx", description: "ddd", ingredients: [Ingredient(ingredient_id: 1, stock_id: 1, name: "saucisse", units: 1, units_unit: "g", units_unit_id: 1)]))
    }
}
