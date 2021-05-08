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
        VStack {
            Button(action: {
                print("home")
            }){
                HStack{
                    Spacer()
                    Text("Sur place").font(.headline).foregroundColor(.white)
                    Spacer()
                }.padding(.vertical, 10)
                .background(Color.blue)
            }
            Button(action: {
                print("emporter")
            }){
                HStack{
                    Spacer()
                    Text("A emporter").font(.headline).foregroundColor(.white)
                    Spacer()
                }.padding(.vertical, 10)
                .background(Color.blue)
            }
        }.padding(.horizontal,  40)

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(router: Router())
    }
}
