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

    @EnvironmentObject var Command: Command
    
    @Binding var filterByType: String
    
    
    let categories: [String] = ["entrée", "plat", "dessert", "boisson"]
    
    let layout = [ GridItem(.adaptive(minimum: 180))]
    
    @State var selection: Int? = nil
    
    var body: some View {
            ScrollView {
            HStack (alignment: .center, spacing: 10) {
                Image("logo-white")
                    .resizable()
                    .frame(width: 150, height: 150)
            }
                if Command.platList.plats.count > 0 {
                    NavigationLink(destination: RecapCommandView(CommandList: Command.platList.plats), tag: 1, selection: $selection){
                        Button(action: {
                            self.selection = 1
                        }){
                            HStack {
                                Text("Passer commande").font(.system(size: 16)).foregroundColor(.white)
                            }.padding()
                            .background(Color.blue)
                        }
                        }
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
