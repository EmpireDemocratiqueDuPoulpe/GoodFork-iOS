//
//  ReservationView.swift
//  TheGoodFork
//
//  Created by admin on 19/05/2021.
//

import SwiftUI
import UIKit

struct ReservationView: View {
    
    @EnvironmentObject var Api: Api
    
    @State private var name: String = ""
    @StateObject var router: Router
    @State private var numOfPeople = "0"
    @State var selection: Int? = nil
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
   
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    @State private var date = Date()
    
    var body: some View {
            ScrollView{
                HStack (alignment: .center, spacing: 10) {
                    Image("logo_full_g")
                        .resizable()
                        .frame(width: 150, height: 150)
                }
                VStack (spacing: 15){
                    HStack{
                        Text("Nom : ")
                        TextField("Nom", text : $name)
                            .cornerRadius(3.0)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    
                    VStack {
                        DatePicker("Date : ", selection: $date, in: Date()..., displayedComponents: .date).environment(\.locale, Locale.init(identifier: "fr"))
                    }
                    VStack {
                        DatePicker("Heure : ", selection: $date, displayedComponents: .hourAndMinute).environment(\.locale, Locale.init(identifier: "fr"))
                    }
                    VStack(alignment: .leading, spacing: 10){
                        Text("Nombre de personnes : ")
                        TextField("0", text: $numOfPeople)
                            .keyboardType(.numberPad)
                              .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                }.padding(.horizontal,  30)
                
                NavigationLink(destination:HomeView(router: router, user: Api.user ?? User(user_id: 0, role: "waiter", first_name: "test", last_name: "test", email: "test@gmail.com")).navigationBarHidden(true), tag: 1, selection: $selection){
                Button(action: {
                    Api.addBooking(userId: Api.user?.user_id ?? 0, time: self.date, clientsNb: Int(self.numOfPeople) ?? 0)
                    self.selection = 1
                }){
                    HStack{
                        Spacer()
                        Text("R??server").font(.headline).foregroundColor(Color("DarkerPrimaryLight"))
                        Spacer()
                    }.padding(.vertical, 10)
                    .background(Color("Secondary")).cornerRadius(5.0).padding(.horizontal,  40)
                }}

        }.navigationTitle("R??servation")
    }
}

struct ReservationView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationView(router: Router())
    }
}
