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
    
    @State private var username: String = ""
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
        VStack(alignment: .leading, spacing: 10) {
                Text("Username").font(.headline)
                TextField(("Username"), text : $username)
                    .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                    .padding(.bottom, 10)
                
                Text("Email").font(.headline)
                TextField(("Email"), text : $email)
                    .cornerRadius(3.0)
                    .padding(.bottom, 10)
                
                Text("Password").font(.headline)
                SecureField("Password", text : $password)
                    .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                    .padding(.bottom, 10)
                
                Text("Confirm password").font(.headline)
                SecureField("Confirm password", text : $confirmPassword)
                    .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                    .padding(.bottom, 10)
            
            Button(action: {
                Api.addUser(firstName: self.username, email: self.email, password1: self.password, password2: self.confirmPassword)
            }){
                HStack{
                    Spacer()
                    Text("Register").font(.headline).foregroundColor(.white)
                    Spacer()
                }.padding(.vertical, 10)
                .background(Color.blue).cornerRadius(5.0).padding(.horizontal,  40)
            }
            
            
            Button(action: {
                router.currentPage = .connection
            }){
                HStack{
                    Spacer()
                    Text("Connection").font(.headline).foregroundColor(.blue)
                    Spacer()
                }
            }

        }.padding()
        .navigationBarHidden(true)
        }
    }
}

struct InscriptionView_Previews: PreviewProvider {
    static var previews: some View {
        InscriptionView(router: Router())
    }
}
