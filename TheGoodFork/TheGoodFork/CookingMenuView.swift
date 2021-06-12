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
    private var i: Int = 0
    
    mutating func increment() {
        self.i += 1
    }
    
    
    var body: some View {
        ScrollView {
            ForEach(Array(Api.allOrderId), id:\.key) { value in
                if value.value.entree.count > 0 {
                    Section(header: Text("Entrées n°\(value.key)").font(.headline)) {
                        ToggleIsFinishedView(showGreeting: false, id: self.i)
                        ForEach(value.value.entree, id:\.menu_id) { item in
                            Text("\(item.name)")
                        }
                    }
                }
                if value.value.plat.count > 0 {
                    Section(header: Text("Plats n°\(value.key)").font(.headline)) {
                        ToggleIsFinishedView(showGreeting: false, id: i+1)
                        ForEach(value.value.plat, id:\.menu_id) { item in
                            Text("\(item.name)")
                        }
                    }
                }

                if value.value.dessert.count > 0 {
                    Section(header: Text("Desserts n°\(value.key)").font(.headline)) {
                        ToggleIsFinishedView(showGreeting: false, id: i+2)
                        ForEach(value.value.dessert, id:\.menu_id) { item in
                            Text("\(item.name)")
                        }
                    }
                }

                if value.value.dessert.count > 0 {
                    Section(header: Text("Boissons n°\(value.key)").font(.headline)) {
                        ToggleIsFinishedView(showGreeting: false, id: i+3)
                        ForEach(value.value.boisson, id:\.menu_id) { item in
                            Text("\(item.name)")
                        }
                    }
                }
            }
            

        }.navigationTitle("Commandes en attente")
}
}

struct CookingMenuView_Previews: PreviewProvider {
    static var previews: some View {
        CookingMenuView()
    }
}
