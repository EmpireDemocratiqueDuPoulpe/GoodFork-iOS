//
//  RecapCommand.swift
//  TheGoodFork
//
//  Created by admin on 29/05/2021.
//


import SwiftUI
import UIKit

struct RecapCommandView: View {

    @EnvironmentObject var Command: Command
    @EnvironmentObject var Api: Api
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10){
                Section(header: Text("Entrées").font(.headline)) {
                    ForEach(Array(Command.commandPlat.filter({ $0.value.type == "entrée"})), id: \.key) { value in
                            HStack{
                                Text("\(value.value.count)x").foregroundColor(.orange)
                                Text("\(value.value.name)").foregroundColor(.green)
                                Spacer()
                                Text("\(value.value.price)€")
                            }
                        }
                        }
                Section(header: Text("Plats").font(.headline)) {
                ForEach(Array(Command.commandPlat.filter({ $0.value.type == "plat"})), id: \.key) { value in
                        HStack{
                            Text("\(value.value.count)x").foregroundColor(.orange)
                            Text("\(value.value.name)").foregroundColor(.green)
                            Spacer()
                            Text("\(value.value.price)€")
                        }
                    }
                    }
                
                Section(header: Text("Desserts").font(.headline)) {
                ForEach(Array(Command.commandPlat.filter({ $0.value.type == "dessert"})), id: \.key) { value in
                        HStack{
                            Text("\(value.value.count)x").foregroundColor(.orange)
                            Text("\(value.value.name)").foregroundColor(.green)
                            Spacer()
                            Text("\(value.value.price)€")
                        }
                    }
                    }
                Section(header: Text("Boissons").font(.headline)) {
                ForEach(Array(Command.commandPlat.filter({ $0.value.type == "boisson"})), id: \.key) { value in
                        HStack{
                            Text("\(value.value.count)x").foregroundColor(.orange)
                            Text("\(value.value.name)").foregroundColor(.green)
                            Spacer()
                            Text("\(value.value.price)€")
                        }
                    }
                    }
                HStack{
                    Spacer()
                    Text("Total : \(String(format: "%.2f", Command.total))€")
                    Spacer()
                }
            }.padding(.horizontal,  10)
            
            NavigationLink(destination: Text("Payer")){
                Button(action: {
                    Api.addCommand(comm: Command.platList)
                }){
                    HStack{
                        Spacer()
                        Text("Payer").font(.system(size: 20)).foregroundColor(.white)
                        Spacer()
                    }.padding(.vertical, 15)
                    .background(Color.blue)
                }
            }
        }.navigationTitle("Récapitulatif de la commande")
}
}

struct RecapCommandView_Previews: PreviewProvider {
    static var previews: some View {
        RecapCommandView()
    }
}
