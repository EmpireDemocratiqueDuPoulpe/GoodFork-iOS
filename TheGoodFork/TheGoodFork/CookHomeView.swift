//
//  CookHomeView.swift
//  TheGoodFork
//
//  Created by admin on 11/06/2021.
//

import SwiftUI
import UIKit


struct CookHomeView: View {
    
    @EnvironmentObject var Api: Api
    @StateObject var router: Router
    @State var selection: Int? = nil
    
    @State var user: User
    
    @State private var filterByType = "entrée"
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    HStack {
                        Spacer()
                        Image("logo-white")
                            .resizable()
                            .frame(width: 150, height: 150)
                        Spacer()
                    }
                    Text("Bienvenue \(self.user.first_name)").font(.headline)

                            NavigationLink(destination: CookingMenuView(), tag: 2, selection: $selection){
                                Button(action: {
                                    Api.getAllWaitings()
                                    self.selection = 2
                                }){
                                    HStack{
                                        Spacer()
                                        Image("booking_w")
                                            .resizable()
                                            .frame(width: 80, height: 80)
                                        Text("Commandes").font(.system(size: 16)).foregroundColor(.white)
                                        Spacer()
                                    }.padding(.vertical, 20)
                                    .background(Color.blue)
                                }.padding(.horizontal,  30)
                            }

                    NavigationLink(destination: CarteView(filterByType: $filterByType), tag: 1, selection: $selection){
                        Button(action: {
                            self.selection = 1
                        }){
                            HStack{
                                Spacer()
                                Image("menu_w")
                                    .resizable()
                                    .frame(width: 80, height: 80).padding(.horizontal,  20)
                                Text("Carte").font(.system(size: 20)).foregroundColor(.white)
                                Spacer()
                            }.padding(.vertical, 20)
                            .background(Color.blue)
                        }.padding(.horizontal,  30)
                    }

                    Button(action: {
                        Api.logout()
                    }){
                        HStack{
                            Spacer()
                            Text("Déconnexion").font(.headline).foregroundColor(.white)
                            Spacer()
                        }.padding(.vertical, 10)
                        .background(Color.blue).cornerRadius(5.0).padding(.horizontal,  40)
                    }
                }
            }
        }
        }
        
}

struct CookHomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(router: Router(), user: User(user_id: 0, role: "waiter", first_name: "test", last_name: "test", email: "test@gmail.com"))
    }
}
