//
//  PlatCellView.swift
//  TheGoodFork
//
//  Created by admin on 10/05/2021.
//

import SwiftUI
import UIKit


struct PlatCellView: View {

    let plat: Recette
    
    var body: some View {
            HStack{
                Spacer()
                Text(plat.name)
                Spacer()
                Text("\(String(format: "%.2f", plat.price))€").font(.body).bold()
                Spacer()
            }.padding(.vertical, 30)
            .background(Image(uiImage: "http://3.134.79.46:8080/images/\(plat.image_path ?? "")".load()).resizable().blur(radius: 1).colorMultiply(Color(red: 1, green: 1, blue: 1, opacity: 0.4)))
            .foregroundColor(Color(.label))
    }
}
struct PlatCellView_Previews: PreviewProvider {
    static var previews: some View {
        PlatCellView(plat: Recette(menu_id: 1, name: "Pizza", type: "dessert", type_id: 2, image_path: "xx", description: "ddd", price: 2, ingredients: [], how_much: 1))
    }
}


