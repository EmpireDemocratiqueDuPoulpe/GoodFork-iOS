//
//  RecapCommand.swift
//  TheGoodFork
//
//  Created by admin on 29/05/2021.
//


import SwiftUI
import UIKit

struct RecapCommandView: View {

    @State var CommandList: [Plat]
    
    var body: some View {
        ScrollView {
        HStack (alignment: .center, spacing: 10) {
            Image("logo-white")
                .resizable()
                .frame(width: 150, height: 150)
            }
            VStack{
                ForEach(CommandList, id: \.id) { plat in
                        Text("\(plat.name)")
                    }
            }
        }
        
    }
}


struct RecapCommandView_Previews: PreviewProvider {
    static var previews: some View {
        RecapCommandView(CommandList: [Plat(id: 0, name: "test", price: 59, type: "boisson")])
    }
}
