//
//  RecapCommand.swift
//  TheGoodFork
//
//  Created by admin on 29/05/2021.
//


import SwiftUI
import UIKit

//Recapitulatif de la commande
struct RecapCommandView: View {

    @StateObject var router: Router
    @EnvironmentObject var Command: Command
    @EnvironmentObject var Api: Api
    @State var selection: Int? = nil
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10){
                Section(header: Text("Entrées").font(.headline)) {
                    ForEach(Array(Command.commandPlat.filter({ $0.value.type == "entrée"})), id: \.key) { value in
                            HStack{
                                Text("\(value.value.count)x")
                                Text("\(value.value.name)")
                                Spacer()
                                Text("\(String(format: "%.2f", value.value.price))€")
                            }
                        }
                    }
                Section(header: Text("Plats").font(.headline)) {
                ForEach(Array(Command.commandPlat.filter({ $0.value.type == "plat"})), id: \.key) { value in
                        HStack{
                            Text("\(value.value.count)x")
                            Text("\(value.value.name)")
                            Spacer()
                            Text("\(String(format: "%.2f", value.value.price))€")
                        }
                    }
                    }
                
                Section(header: Text("Desserts").font(.headline)) {
                ForEach(Array(Command.commandPlat.filter({ $0.value.type == "dessert"})), id: \.key) { value in
                        HStack{
                            Text("\(value.value.count)x")
                            Text("\(value.value.name)")
                            Spacer()
                            Text("\(String(format: "%.2f", value.value.price))€")
                        }
                    }
                    }
                Section(header: Text("Boissons").font(.headline)) {
                ForEach(Array(Command.commandPlat.filter({ $0.value.type == "boisson"})), id: \.key) { value in
                        HStack{
                            Text("\(value.value.count)x")
                            Text("\(value.value.name)")
                            Spacer()
                            Text("\(String(format: "%.2f", value.value.price))€")
                        }
                    }
                    }
                HStack{
                    Spacer()
                    Text("Total : \(String(format: "%.2f", Command.total))€")
                    Spacer()
                }
            }.padding(.horizontal,  10)
            
            NavigationLink(destination:HomeView(router: router, user: Api.user ?? User(user_id: 0, role: "waiter", first_name: "test", last_name: "test", email: "test@gmail.com")).navigationBarHidden(true), tag: 1, selection: $selection){
                Button(action: {
                    if Command.platList.is_take_away{
                        Api.addTakeAwayCommand(comm: Command.platList)
                    }else{
                        Api.addCommand(comm: Command.platList)
                    }
                    self.selection = 1
                }){
                    HStack{
                        Spacer()
                        Text("Commander").font(.system(size: 20)).foregroundColor(Color("DarkerPrimaryLight"))
                        Spacer()
                    }.padding(.vertical, 15)
                    .background(Color("Secondary"))
                }
            }
        }.navigationTitle("Récapitulatif de la commande")
}
}

struct RecapCommandView_Previews: PreviewProvider {
    static var previews: some View {
        RecapCommandView(router: Router())
    }
}
