//
//  CommandView.swift
//  TheGoodFork
//
//  Created by admin on 18/05/2021.
//

import SwiftUI
import UIKit

struct CommandView: View {
    @EnvironmentObject var Api: Api

    @Binding var filterByType: String
    
    
    let categories: [String] = ["entrée", "plat", "dessert", "boisson"]
    
    let layout = [ GridItem(.adaptive(minimum: 180))]
    
    var body: some View {
            ScrollView {
            HStack (alignment: .center, spacing: 10) {
                Image("logo-white")
                    .resizable()
                    .frame(width: 150, height: 150)
            }
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
                CommandPlatGridView(filterByType: $filterByType , layout: layout, plats: Api.recettes!)
            }
}
    func filter(by label: String) {
        filterByType = label
    }
    }

struct CommandView_Previews: PreviewProvider {
    static var previews: some View {
        CommandView(filterByType: Binding.constant("Entrée"))
    }
}
