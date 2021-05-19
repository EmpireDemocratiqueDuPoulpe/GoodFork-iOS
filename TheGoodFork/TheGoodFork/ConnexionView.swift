//
//  ConnexionView.swift
//  TheGoodFork
//
//  Created by admin on 12/04/2021.
//

import SwiftUI

struct ConnexionView: View {

    @EnvironmentObject var Api: Api

    @StateObject var router: Router
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
            VStack(alignment: .leading, spacing: 10) {
                HStack (alignment: .center, spacing: 10) {
                    Spacer()
                    Image("logo-white")
                        .resizable()
                        .frame(width: 150, height: 150)
                    Spacer()
                }
                
                Text("Email").font(.headline)
                TextField(("Email"), text : $email)
                    .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                    .padding(.bottom, 10)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Text("Mot de passe").font(.headline)
                SecureField("Mot de passe", text : $password)
                    .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                    .padding(.bottom, 10)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    Api.login(email: self.email, password: self.password)
                    if Api.token != nil{
                        router.currentPage = .home
                    }
                }){
                    HStack{
                        Spacer()
                        Text("Connexion").font(.headline).foregroundColor(.white)
                        Spacer()
                    }.padding(.vertical, 10)
                    .background(Color.blue).cornerRadius(5.0).padding(.horizontal,  40)
                }
                
                Button(action: {
                    router.currentPage = .register
                }){
                    HStack{
                        Spacer()
                        Text("Inscription").font(.headline).foregroundColor(.blue)
                        Spacer()
                    }
                }
            }.padding()
            .navigationBarHidden(true)
    }
}

struct ConnexionView_Previews: PreviewProvider {
    static var previews: some View {
        ConnexionView(router: Router())
    }
}
