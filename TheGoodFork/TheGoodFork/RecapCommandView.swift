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
        HStack (alignment: .center, spacing: 10) {
            Image("logo-white")
                .resizable()
                .frame(width: 150, height: 150)
            }
            VStack(alignment: .leading, spacing: 10){
                Section(header: Text("Entrée").font(.headline)) {
                    ForEach(Array(Command.commandPlat.filter({ $0.value.type == "entrée"})), id: \.key) { value in
                            HStack{
                                Text("\(value.value.name)")
                                Text("x \(value.value.count)")
                                Text(" - \(value.value.price)€")
                            }
                        }
                        }
                Section(header: Text("Plat").font(.headline)) {
                ForEach(Array(Command.commandPlat.filter({ $0.value.type == "plat"})), id: \.key) { value in
                        HStack{
                            Text("\(value.value.name)")
                            Text("x \(value.value.count)")
                            Text(" - \(value.value.price)€")
                        }
                    }
                    }
                
                Section(header: Text("Dessert").font(.headline)) {
                ForEach(Array(Command.commandPlat.filter({ $0.value.type == "dessert"})), id: \.key) { value in
                        HStack{
                            Text("\(value.value.name)")
                            Text("x \(value.value.count)")
                            Text(" - \(value.value.price)€")
                        }
                    }
                    }
                Section(header: Text("Boisson").font(.headline)) {
                ForEach(Array(Command.commandPlat.filter({ $0.value.type == "boisson"})), id: \.key) { value in
                        HStack{
                            Text("\(value.value.count)x \(value.value.name)")
                            Text(" - \(value.value.price)€")
                        }
                    }
                    }
                Text("Total : \(String(format: "%.2f", Command.total))€")
            }.padding(.horizontal,  50)
            
            NavigationLink(destination: Text("Payer")){
                Button(action: {
                    Api.addCommand(comm: Command.platList)
                }){
                    HStack{
                        Text("Payer").font(.system(size: 20)).foregroundColor(.white)
                    }.padding(.vertical, 10)
                    .background(Color.blue)
                }.padding(.horizontal,  30)
            }
    }
}
}

struct RecapCommandView_Previews: PreviewProvider {
    static var previews: some View {
        RecapCommandView()
    }
}
