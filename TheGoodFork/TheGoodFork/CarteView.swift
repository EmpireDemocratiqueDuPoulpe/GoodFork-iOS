//
//  CarteView.swift
//  TheGoodFork
//
//  Created by admin on 08/05/2021.
//

import SwiftUI
import UIKit


struct CarteView: View {
    @EnvironmentObject var Api: Api
    
    @Binding var filterByType: String
    
    let categories: [String] = ["entrée", "plat", "dessert", "boisson"]
    
    let layout = [ GridItem(.adaptive(minimum: 180))]
    
    var body: some View {
            ScrollView {

        HStack{
            ForEach(categories, id: \.self){ category in
                Button(action: {}, label: {
                    Text(category)
                        .fontWeight(category == filterByType ? .bold : .regular)
                        .padding(.horizontal, 6)
                        .foregroundColor(category == filterByType ? Color(.label): .secondary)
                        .onTapGesture {
                            filter(by: category)
                        }
                })
            }
        }

                PlatGridView(filterByType: $filterByType , layout: layout, plats: Api.recettes)
            }
}
    func filter(by label: String) {
        filterByType = label
    }
    }

struct CarteView_Previews: PreviewProvider {
    static var previews: some View {
        CarteView(filterByType: Binding.constant("Entrée"))
    }
}

