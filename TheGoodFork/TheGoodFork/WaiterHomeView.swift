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

                Text("Bienvenue \(self.username)").font(.headline)
                
                NavigationLink(destination: CarteView(filterByType: $filterByType), tag: 1, selection: $selection){
                    Button(action: {
                        self.selection = 1
                    }){
                        HStack{
                            Image("logo-white")
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

struct WaiterHomeView_Previews: PreviewProvider {
    static var previews: some View {
        WaiterHomeView(router: Router(), username: "Bla")
    }
}
