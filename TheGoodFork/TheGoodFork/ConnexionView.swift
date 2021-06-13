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
    @State private var authFailed: Bool = false
    
    var body: some View {
            VStack(alignment: .leading, spacing: 10) {
                HStack (alignment: .center, spacing: 10) {
                    Spacer()
                    Image("logo_full_g")
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
                if authFailed {
                    Text("\(Api.base?.error ?? "")")
                        .offset(y: -10)
                        .foregroundColor(.red)
                }
                Button(action: {
                    Api.login(email: self.email, password: self.password)
                    if Api.token != nil{
                        router.currentPage = .home
                    }
                    else{
                        self.authFailed = true
                    }
                }){
                    HStack{
                        Spacer()
                        Text("Connexion").font(.headline).foregroundColor(Color("DarkerPrimaryLight"))
                        Spacer()
                    }.padding(.vertical, 10)
                    .background(Color("Secondary")).cornerRadius(5.0).padding(.horizontal,  40)
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
