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
    
    var body: some View {
        HStack (alignment: .center, spacing: 10) {
            Spacer()
            Image("logo-white")
                .resizable()
                .frame(width: 150, height: 150)
            Spacer()
        }
        Text("Bienvenue").font(.headline)
        HStack {
            Button(action: {
                print("home")
            }){
                VStack{
                    Image("logo-white")
                        .resizable()
                        .frame(width: 80, height: 80)
                    Text("Sur place").font(.system(size: 16)).foregroundColor(.white)
                }.padding(.horizontal,  22).padding(.vertical,  30)
                .background(Color.blue)
            }
            Button(action: {
                print("emporter")
            }){
                VStack{
                    Image("logo-white")
                        .resizable()
                        .frame(width: 80, height: 80)
                    Text("A emporter").font(.system(size: 16)).foregroundColor(.white)
                }.padding(.horizontal,  22).padding(.vertical,  30)
                .background(Color.blue)
            }
        }.padding(.horizontal,  30)
            Button(action: {
                print("carte")
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(router: Router())
    }
}
