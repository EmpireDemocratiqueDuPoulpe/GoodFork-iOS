//
//  ConnexionView.swift
//  TheGoodFork
//
//  Created by admin on 12/04/2021.
//

import SwiftUI

struct ConnexionView: View {

    @StateObject var router: Router
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        switch router.currentPage {
        case .register:
            InscriptionView(router: router).navigationBarHidden(true)
        case .connection:
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
                
                Text("Password").font(.headline)
                SecureField("Password", text : $password)
                    .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                    .padding(.bottom, 10)
                
                Button(action: {
                    print("\(self.email) and \(self.password)")
                }){
                    HStack{
                        Spacer()
                        Text("Login").font(.headline).foregroundColor(.white)
                        Spacer()
                    }.padding(.vertical, 10)
                    .background(Color.blue).cornerRadius(5.0).padding(.horizontal,  40)
                }
                
                Button(action: {
                    router.currentPage = .register
                }){
                    HStack{
                        Spacer()
                        Text("Register").font(.headline).foregroundColor(.blue)
                        Spacer()
                    }
                }
            }.padding()
            .navigationBarHidden(true)
        }

    }
}

struct ConnexionView_Previews: PreviewProvider {
    static var previews: some View {
        ConnexionView(router: Router())
    }
}
