//
//  CookingMenuView.swift
//  TheGoodFork
//
//  Created by admin on 11/06/2021.
//

import SwiftUI
import UIKit

struct CookingMenuView: View {

    @EnvironmentObject var Api: Api
    
    var body: some View {
        ScrollView {
            ForEach(Array(Api.allOrderId), id:\.key) { value in
                Section(header: Text("Entrées n°\(value.key)").font(.headline)) {
                    ForEach(value.value.entree, id:\.menu_id) { item in
                        Text("\(item.name)")
                    }
                }
                Section(header: Text("Plats n°\(value.key)").font(.headline)) {
                    ForEach(value.value.plat, id:\.menu_id) { item in
                        Text("\(item.name)")
                    }
                }
                Section(header: Text("Desserts n°\(value.key)").font(.headline)) {
                    ForEach(value.value.dessert, id:\.menu_id) { item in
                        Text("\(item.name)")
                    }
                }
                Section(header: Text("Boissons n°\(value.key)").font(.headline)) {
                    ForEach(value.value.boisson, id:\.menu_id) { item in
                        Text("\(item.name)")
                    }
                }
            }
            

        }.navigationTitle("Menus en attente")
}
}

struct CookingMenuView_Previews: PreviewProvider {
    static var previews: some View {
        CookingMenuView()
    }
}
