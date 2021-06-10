//
//  CommandPlatCellView.swift
//  TheGoodFork
//
//  Created by admin on 18/05/2021.
//

import SwiftUI
import UIKit

public extension String {
    func load() -> UIImage {
        
        do {
            guard let url = URL(string: self) else{
                return UIImage()
            }
            
            let data: Data = try Data(contentsOf: url)
            
            return UIImage(data: data) ?? UIImage()
        } catch  {
            //
        }
        
        return UIImage()
    }
}

struct CommandPlatCellView: View {

    @EnvironmentObject var Command: Command
    
    let plat: Recette
    
    var body: some View {
            HStack{
                Spacer()
                Text(plat.name)
                Spacer()
                Text("\(String(format: "%.2f", plat.price))€").font(.body).bold()
                

                if (Command.commandPlat[plat.menu_id] != nil) && Command.commandPlat[plat.menu_id]!.count > 0  {
                    Button(action: {
                        Command.deletePlat(id: plat.menu_id, name: plat.name, price: plat.price, type: plat.type)
                    }){
                        Image(systemName: "minus.circle.fill").resizable()
                            .frame(width: 32.0, height: 32.0).foregroundColor(.red)
                    }
                    Text("\(Command.commandPlat[plat.menu_id]!.count)")
                }
                Button(action: {
                    Command.addPlat(id: plat.menu_id, name: plat.name, price: plat.price, type: plat.type)
                }){
                    Image(systemName: "plus.circle.fill").resizable()
                        .frame(width: 32.0, height: 32.0).foregroundColor(.green)
                }
                
            }.padding(.vertical, 30)
            .background(Image(uiImage: "http://3.134.79.46:8080/images/\(plat.image_path ?? "")".load()).resizable().blur(radius: 1).colorMultiply(Color(red: 1, green: 1, blue: 1, opacity: 0.4)))
            .foregroundColor(Color(.label))
    }
}
struct CommandPlatCellView_Previews: PreviewProvider {
    static var previews: some View {
        CommandPlatCellView(plat: Recette(menu_id: 1, name: "Pizza", type: "dessert", type_id: 2, image_path: "xx", description: "ddd", price: 2, ingredients: [Ingredient(ingredient_id: 1, stock_id: 1, name: "saucisse", units: 1, units_unit: "g", units_unit_id: 1)]))
    }
}
