//
//  PlatDetailView.swift
//  TheGoodFork
//
//  Created by admin on 18/05/2021.
//

import SwiftUI
import UIKit


struct PlatDetailView: View {

    let plat: Plat
    
    var body: some View {
        VStack{
            HStack {
                Image(plat.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipped()
            }
            HStack{
                Text(plat.name).font(.headline)
                Spacer()
                Text("\(plat.price)€")
                    .font(.body)
                    .bold()

            }
            VStack(alignment: .leading,  spacing: 10){
                Spacer()
                Text("Description")
                Text("Très bon").font(.footnote)
                Spacer()
                List {
                    Section(header: Text("Composition")) {
                        Text("Merguez")
                        Text("Semoule")
                        Text("Tomates")
                        Text("Merguez")
                        Text("Semoule")
                        Text("Tomates")
                        Text("Merguez")
                        Text("Semoule")
                        Text("Tomates")
                    }
                }
                .listStyle(GroupedListStyle())
            }
            
        }.padding(.horizontal,  20)

    
    }
}
struct PlatDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlatCellView(plat: Plat(price: 10, name: "pizza", image: "logo-white", type: "plat"))
    }
}
