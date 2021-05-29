//
//  InscriptionView.swift
//  TheGoodFork
//
//  Created by admin on 14/04/2021.
//

import SwiftUI

struct InscriptionView: View {
    
    @EnvironmentObject var Api: Api
    
    @StateObject var router: Router
    @State private var authFailed: Bool = false
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    var body: some View {
        HStack (alignment: .center, spacing: 10) {
            Spacer()
            Image("logo-white")
                .resizable()
                .frame(width: 150, height: 150)
            Spacer()
        }
        ScrollView {
        VStack(alignment: .leading, spacing: 5) {
                Text("Nom").font(.headline)
                TextField(("Nom"), text : $lastName)
                    .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                    .padding(.bottom, 10)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Text("Prénom").font(.headline)
                TextField(("Prénom"), text : $firstName)
                    .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                    .padding(.bottom, 10)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Text("Email").font(.headline)
                TextField(("Email"), text : $email)
                    .cornerRadius(3.0)
                    .padding(.bottom, 10)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Text("Mot de passe").font(.headline)
                SecureField("Mot de passe", text : $password)
                    .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                    .padding(.bottom, 10)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Text("Confirmation du mot de passe").font(.headline)
                SecureField("Mot de passe", text : $confirmPassword)
                    .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                    .padding(.bottom, 10)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                }.padding()
            
            if authFailed {
                Text("\(Api.base?.error ?? "")")
                    .offset(y: -10)
                    .foregroundColor(.red)
                    .padding()
            }
            
            Button(action: {
                Api.addUser(lastName: self.lastName, firstName: self.firstName, email: self.email, password1: self.password, password2: self.confirmPassword)
                if Api.token != nil{
                    router.currentPage = .home
                }
                else{
                    self.authFailed = true
                }
            }){
                HStack{
                    Spacer()
                    Text("Inscription").font(.headline).foregroundColor(.white)
                    Spacer()
                }.padding(.vertical, 10)
                .background(Color.blue).cornerRadius(5.0).padding(.horizontal,  40)
            }
            
            
            Button(action: {
                router.currentPage = .connection
            }){
                HStack{
                    Spacer()
                    Text("Connexion").font(.headline).foregroundColor(.blue)
                    Spacer()
                }
            }


        }
    }
}

struct InscriptionView_Previews: PreviewProvider {
    static var previews: some View {
        InscriptionView(router: Router())
    }
}
