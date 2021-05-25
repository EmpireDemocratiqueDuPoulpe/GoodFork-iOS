//
//  HomeView.swift
//  TheGoodFork
//
//  Created by admin on 08/05/2021.
//

import SwiftUI
import UIKit


struct HomeView: View {
    
    @StateObject var router: Router
    @State var username: String
    @State var selection: Int? = nil
    
    @State private var filterByType = "entrée"
    
    var body: some View {
        NavigationView{
            VStack{
                HStack {
                    Spacer()
                    Image("logo-white")
                        .resizable()
                        .frame(width: 150, height: 150)
                    Spacer()
                }
                Text("Bienvenue \(self.username)").font(.headline)

                HStack {
                    NavigationLink(destination: CommandView(filterByType: $filterByType), tag: 3, selection: $selection){
                    Button(action: {
                        self.selection = 3
                    }){
                        VStack{
                            Image("booking_w")
                                .resizable()
                                .frame(width: 80, height: 80)
                            Text("Sur place").font(.system(size: 16)).foregroundColor(.white)
                        }.padding(.horizontal,  22).padding(.vertical,  30)
                        .background(Color.blue)
                    }
                    }
                    
                    NavigationLink(destination: Text("A emporter"), tag: 2, selection: $selection){
                        Button(action: {
                            self.selection = 2
                        }){
                            VStack{
                                Image("logo-white")
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                Text("A emporter").font(.system(size: 16)).foregroundColor(.white)
                            }.padding(.horizontal,  22).padding(.vertical,  30)
                            .background(Color.blue)
                        }
                    }

                    
                    
                }.padding(.horizontal,  30)
                
                NavigationLink(destination: CarteView(filterByType: $filterByType), tag: 1, selection: $selection){
                    Button(action: {
                        self.selection = 1
                    }){
                        HStack{
                            Image("menu_w")
                                .resizable()
                                .frame(width: 50, height: 50).padding(.horizontal,  20)
                            Text("Carte").font(.system(size: 20)).foregroundColor(.white)
                            Spacer()
                        }.padding(.vertical, 20)
                        .background(Color.blue)
                    }.padding(.horizontal,  30)
                }


            }
            }
        }
        
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(router: Router(), username: "Bla")
    }
}
