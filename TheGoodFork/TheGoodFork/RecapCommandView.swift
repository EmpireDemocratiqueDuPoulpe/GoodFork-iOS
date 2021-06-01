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
    
    
    var body: some View {
        ScrollView {
        HStack (alignment: .center, spacing: 10) {
            Image("logo-white")
                .resizable()
                .frame(width: 150, height: 150)
            }
            VStack{
                Section(header: Text("Entrée")) {
                    ForEach(Array(Command.commandPlat.filter({ $0.value.type == "entrée"})), id: \.key) { value in

                            HStack{
                                Text("\(value.value.name)")
                                Text("x \(value.value.count)")
                                Text(" - \(value.value.price)€")
                            }
                        }
                        }
                Section(header: Text("Plat")) {
                ForEach(Array(Command.commandPlat.filter({ $0.value.type == "plat"})), id: \.key) { value in
                        HStack{
                            Text("\(value.value.name)")
                            Text("x \(value.value.count)")
                            Text(" - \(value.value.price)€")
                        }
                    }
                    }
                
                Section(header: Text("Dessert")) {
                ForEach(Array(Command.commandPlat.filter({ $0.value.type == "dessert"})), id: \.key) { value in
                        HStack{
                            Text("\(value.value.name)")
                            Text("x \(value.value.count)")
                            Text(" - \(value.value.price)€")
                        }
                    }
                    }
                Section(header: Text("Boisson")) {
                ForEach(Array(Command.commandPlat.filter({ $0.value.type == "boisson"})), id: \.key) { value in
                        HStack{
                            Text("\(value.value.name)")
                            Text("x \(value.value.count)")
                            Text(" - \(value.value.price)€")
                        }
                    }
                    }
            }

    }
}
}

struct RecapCommandView_Previews: PreviewProvider {
    static var previews: some View {
        RecapCommandView()
    }
}
