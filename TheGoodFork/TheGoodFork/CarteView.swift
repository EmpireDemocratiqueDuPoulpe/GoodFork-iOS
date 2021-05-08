//
//  CarteView.swift
//  TheGoodFork
//
//  Created by admin on 08/05/2021.
//

import SwiftUI
import UIKit


struct CarteView: View {
    let categories: [String] = ["Entrée", "Plat", "Dessert", "Boisson"]
    
    var body: some View {
            HStack (alignment: .center, spacing: 10) {
                Spacer()
                Image("logo-white")
                    .resizable()
                    .frame(width: 150, height: 150)
                Spacer()
            }
        HStack{
            ForEach(categories, id: \.self){ category in
                Button(action: {}, label: {
                    Text(category)
                        .fontWeight(category == categories.first ? .bold : .regular)
                        .padding(.horizontal, 6)
                        .foregroundColor(category == categories.first ? Color(.label): .secondary)
                })
            }
        }
}
    }
struct CarteView_Previews: PreviewProvider {
    static var previews: some View {
        CarteView()
    }
}

