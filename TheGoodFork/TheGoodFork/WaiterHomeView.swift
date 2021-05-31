//
//  WaiterHomeView.swift
//  TheGoodFork
//
//  Created by admin on 17/05/2021.
//
import SwiftUI
import UIKit


struct WaiterHomeView: View {
    
    @StateObject var router: Router
    @State var user: User
    @State var selection: Int? = nil
    
    @State private var filterByType = "entrée"
    
    var body: some View {
        NavigationView{
            VStack{
                HStack {
                    Image("logo-white")
                        .resizable()
                        .frame(width: 150, height: 150)
                }
                Text("Bienvenue \(self.user.first_name)").font(.headline)
                
                NavigationLink(destination: CommandView(filterByType: $filterByType).environmentObject(Command(userId: self.user.user_id, isTakeAway: false)), tag: 1, selection: $selection){
                    Button(action: {
                        self.selection = 1
                    }){
                        HStack{
                            Image("orders_w")
                                .resizable()
                                .frame(width: 50, height: 50).padding(.horizontal,  20)
                            Text("Commande").font(.system(size: 20)).foregroundColor(.white)
                            Spacer()
                        }.padding(.vertical, 10)
                        .background(Color.blue)
                    }.padding(.horizontal,  30)
                }
                
                NavigationLink(destination: CarteView(filterByType: $filterByType), tag: 2, selection: $selection){
                    Button(action: {
                        self.selection = 2
                    }){
                        HStack{
                            Image("menu_w")
                                .resizable()
                                .frame(width: 50, height: 50).padding(.horizontal,  20)
                            Text("Carte").font(.system(size: 20)).foregroundColor(.white)
                            Spacer()
                        }.padding(.vertical, 10)
                        .background(Color.blue)
                    }.padding(.horizontal,  30)
                }
                
                NavigationLink(destination: ReservationView(), tag: 3, selection: $selection){
                    Button(action: {
                        self.selection = 3
                    }){
                        HStack{
                            Image("on_the_spot_w")
                                .resizable()
                                .frame(width: 50, height: 50).padding(.horizontal,  20)
                            Text("Réservations").font(.system(size: 20)).foregroundColor(.white)
                            Spacer()
                        }.padding(.vertical, 10)
                        .background(Color.blue)
                    }.padding(.horizontal,  30)
                }
                
                NavigationLink(destination: Text("Alerte"), tag: 4, selection: $selection){
                    Button(action: {
                        self.selection = 4
                    }){
                        HStack{
                            Image("alert_w")
                                .resizable()
                                .frame(width: 50, height: 50).padding(.horizontal,  20)
                            Text("Alerte").font(.system(size: 20)).foregroundColor(.white)
                            Spacer()
                        }.padding(.vertical, 5)
                        .background(Color.blue)
                    }.padding(.horizontal,  30)
                }
                


            }
        }
        }
        
}

struct WaiterHomeView_Previews: PreviewProvider {
    static var previews: some View {
        WaiterHomeView(router: Router(), user: User(user_id: 0, role: "waiter", first_name: "test", last_name: "test", email: "test@gmail.com"))
    }
}
