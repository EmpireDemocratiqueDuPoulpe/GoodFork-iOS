//
//  CommandPlatCellView.swift
//  TheGoodFork
//
//  Created by admin on 18/05/2021.
//

import SwiftUI
import UIKit


struct CommandPlatCellView: View {

    let plat: Recette
    @State var count: Int = 0
    
    var body: some View {
            HStack{
                Spacer()
                Text(plat.name)
                Spacer()
                //Text("\(plat.price)€").font(.body).bold()
                

                if self.count > 0 {
                    Button(action: {
                            self.count -= 1
                    }){
                        Image(systemName: "minus.circle.fill").resizable()
                            .frame(width: 32.0, height: 32.0).foregroundColor(.red)
                    }
                    Text("\(self.count)")
                }
                Button(action: {
                    self.count += 1
                }){
                    Image(systemName: "plus.circle.fill").resizable()
                        .frame(width: 32.0, height: 32.0).foregroundColor(.green)
                }
                
            }.padding(.vertical, 30)
            .background(Image("logo-white").resizable().blur(radius: 1).colorMultiply(Color(red: 1, green: 1, blue: 1, opacity: 0.4)))
            .foregroundColor(Color(.label))
    }
}
struct CommandPlatCellView_Previews: PreviewProvider {
    static var previews: some View {
        CommandPlatCellView(plat: Recette(menu_id: 1, name: "Pizza", type: "dessert", type_id: 2, image_path: "xx", description: "ddd", ingredients: [Ingredient(ingredient_id: 1, stock_id: 1, name: "saucisse", units: 1, units_unit: "g", units_unit_id: 1)]))
    }
}
