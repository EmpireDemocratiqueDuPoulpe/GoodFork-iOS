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
    @State var username: String
    @State var selection: Int? = nil
    
    @State private var filterByType = "Entrée"
    
    var body: some View {
        NavigationView{
            VStack{
                HStack {
                    Image("logo-white")
                        .resizable()
                        .frame(width: 150, height: 150)
                }
                Text("Bienvenue \(self.username)").font(.headline)
                
                NavigationLink(destination: CommandView(filterByType: $filterByType), tag: 1, selection: $selection){
                    Button(action: {
                        self.selection = 1
                    }){
                        HStack{
                            Image("logo-white")
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
                            Image("logo-white")
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
                            Image("logo-white")
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
                            Image("logo-white")
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
        WaiterHomeView(router: Router(), username: "Bla")
    }
}
