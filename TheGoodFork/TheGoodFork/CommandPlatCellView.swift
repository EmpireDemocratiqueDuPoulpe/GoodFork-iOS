//
//  CommandPlatCellView.swift
//  TheGoodFork
//
//  Created by admin on 18/05/2021.
//

import SwiftUI
import UIKit


struct CommandPlatCellView: View {

    let plat: Plat
    @State var count: Int = 0
    
    var body: some View {
            HStack{
                Spacer()
                Text(plat.name)
                Spacer()
                Text("\(plat.price)€")
                    .font(.body)
                    .bold()
                
                Button(action: {
                    if self.count > 0 {
                        self.count -= 1
                    }
                }){
                    Image(systemName: "minus.circle.fill").resizable()
                        .frame(width: 32.0, height: 32.0).foregroundColor(.red)
                }
                if self.count > 0 {
                    Text("\(self.count)")
                }
                Button(action: {
                    self.count += 1
                    print("add")
                }){
                    Image(systemName: "plus.circle.fill").resizable()
                        .frame(width: 32.0, height: 32.0).foregroundColor(.green)
                }
                
            }.padding(.vertical, 30)
            .background(Image(plat.image).resizable().blur(radius: 1).colorMultiply(Color(red: 1, green: 1, blue: 1, opacity: 0.4)))
            .foregroundColor(Color(.label))
    }
}
struct CommandPlatCellView_Previews: PreviewProvider {
    static var previews: some View {
        CommandPlatCellView(plat: Plat(price: 10, name: "pizza", image: "logo-white", type: "plat"))
    }
}
