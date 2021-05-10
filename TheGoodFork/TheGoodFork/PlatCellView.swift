//
//  PlatCellView.swift
//  TheGoodFork
//
//  Created by admin on 10/05/2021.
//

import SwiftUI
import UIKit


struct PlatCellView: View {

    let plat: Plat
    
    var body: some View {
            HStack{
                Spacer()
                Text(plat.name)
                Spacer()
                Text("\(plat.price)€")
                    .font(.body)
                    .bold()
            }.padding(.vertical, 30)
            .background(Image(plat.image).resizable().blur(radius: 1).colorMultiply(Color(red: 1, green: 1, blue: 1, opacity: 0.4)))
            .foregroundColor(Color(.label))
    }
}
struct PlatCellView_Previews: PreviewProvider {
    static var previews: some View {
        PlatCellView(plat: Plat(price: 10, name: "pizza", image: "logo-white", type: "plat"))
    }
}


